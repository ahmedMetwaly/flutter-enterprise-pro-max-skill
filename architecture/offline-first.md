# 🔄 Offline-First Enterprise Architecture & Sync Engine

For enterprise, logistics, POS, and healthcare applications, a true Offline-First architecture guarantees seamless user operation without an active internet connection.

---

## 1. 🏗️ High-Level Offline-First Data Flow

```
                     ┌────────────────┐
                     │ Presentation / │
                     │   UI Layer     │
                     └───────┬────────┘
                             │
                             ▼
                     ┌────────────────┐
                     │  Domain Layer  │
                     │   (UseCases)   │
                     └───────┬────────┘
                             │
                             ▼
                 ┌───────────────────────┐
                 │ Repository Controller │
                 └─────┬───────────┬─────┘
                       │           │
           (Read/Write)│           │(Queue Mutation)
                       ▼           ▼
        ┌───────────────────┐    ┌────────────────────┐
        │  Local Database   │    │     Sync Queue     │
        │  (Drift / SQLite) │    │  (Pending Actions) │
        └───────────────────┘    └─────────┬──────────┘
                                           │
                                 (Network Reconnect)
                                           ▼
                                 ┌────────────────────┐
                                 │    Sync Engine     │
                                 │(Idempotent Retries)│
                                 └─────────┬──────────┘
                                           │
                                           ▼
                                 ┌────────────────────┐
                                 │   Remote API REST  │
                                 │   (Backend Server) │
                                 └────────────────────┘
```

---

## 2. 🧱 Core Components of the Sync Engine

### 1. `SyncQueueItem`:
```dart
class SyncQueueItem {
  final String id;              // Unique UUIDv4 idempotency key
  final String endpoint;        // REST endpoint path
  final String httpMethod;      // POST, PUT, DELETE
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final int retryCount;
  final String status;          // pending, in_progress, failed
}
```

### 2. `SyncEngine` (`core/sync/sync_engine.dart`):
1. **Connectivity Listener**: Listens to `ConnectivityService`. When network returns:
2. **Batch Processing**: Processes pending items from oldest to newest.
3. **Exponential Backoff**: If a request fails with a network error, waits `2^retryCount * 1000ms`.
4. **Idempotency**: Includes `X-Idempotency-Key: id` in HTTP headers to prevent duplicate backend writes.
5. **Conflict Resolution**:
   - **Client-Wins**: Local changes overwrite server.
   - **Server-Wins**: Server entity version takes precedence.
   - **Timestamp-Based**: Latest `updatedAt` ISO8601 wins.
