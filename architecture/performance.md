# ⚡ Flutter Enterprise Performance Engineering Guide

Performance engineering in Flutter requires distinguishing between widget identity, rebuild scope, list virtualization, memory management, and asynchronous computation.

---

## 1. 🔍 De-mystifying Performance: What Matters vs What Doesn't

| Technique | Real Impact | Why |
| :--- | :--- | :--- |
| **`const` Constructors** | Memory / Canonical Allocation | Reuses existing object instances in memory at compile time; reduces GC pressure. Does *not* prevent rebuilds triggered by ancestor state changes. |
| **Granular Rebuild Scope (`BlocSelector` / `select`)** | High Rendering Impact | Restricts widget tree rebuilding to the exact leaf node that consumes the changed property. |
| **List Virtualization (`ListView.builder`)** | Critical Frame Rate Impact | Lazily creates only visible viewports on screen, preventing unbounded GPU/CPU allocation. |
| **Heavy Computation Isolation (`compute()` / `Isolate.run`)** | Critical UI Responsiveness | Offloads JSON parsing, cryptographic hashing, and image decoding away from the 60/120fps UI thread. |
| **Image Caching & Repaint Boundaries** | High GPU Optimization | Uses `RepaintBoundary` on animated or frequently refreshed cards to isolate GPU render layers. |

---

## 2. 🏗️ Build Performance Best Practices

1. **Scoped State Selectors**:
   - In Bloc: Use `BlocSelector<MyCubit, MyState, String>(selector: (state) => state.userName, builder: ...)` so other state property changes do not trigger a rebuild.
   - In Riverpod: Use `ref.watch(myProvider.select((s) => s.userName))`.
2. **Eliminate Function Widgets**:
   - NEVER write `Widget buildHeader() => Container(...)`. Helper functions do not have their own `BuildContext` or element lifecycle; whenever the parent rebuilds, the entire function widget tree re-executes.
   - ALWAYS create a dedicated `StatelessWidget` / `StatefulWidget` class per component.
3. **Repaint Boundaries on Animated Components**:
   - Wrap constantly animating widgets (like custom progress spinners or charts) in `RepaintBoundary` to prevent repainting the parent scaffold.

---

## 3. 🧠 Memory Management & Zero Leaks

1. **Mandatory Disposal Pattern**:
   - Every `TextEditingController`, `ScrollController`, `TabController`, `AnimationController`, and `FocusNode` created in a `StatefulWidget` **MUST** be disposed in `dispose()`.
2. **Stream & Timer Subscriptions**:
   - Cancel all `StreamSubscription`s and `Timer`s on widget or Cubit close.
3. **Bounded In-Memory Caches**:
   - Set maximum entries and eviction policies (LRU) on in-memory caches to prevent memory creep during long sessions.

---

## 4. 🗄️ Data & Networking Performance

1. **Pagination**:
   - Use pagination on all lists exceeding 20 items. Standardize on `PaginationScrollListener` triggering at 80% scroll extent.
2. **Dio Request Deduplication & Cache Interceptors**:
   - Cache non-volatile GET requests with TTL (e.g. 5 minutes) to save bandwidth and improve perceived speed.
3. **Heavy JSON Parsing in Isolates**:
   - For payloads > 100KB: Use `compute(deserializeModelList, jsonString)`.
