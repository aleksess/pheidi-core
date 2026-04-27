# 🏃‍♂️ Pheidi Core: Roadmap & To-Do List

This document tracks the progress of the Pheidi Messaging Engine toward its 1.0.0 "Victory" release.

---

## 🏗️ Phase 1: Foundations (The Starting Line)
*Goal: Establish infrastructure, database isolation, and the "Outbase" architecture.*

- [ ] **Namespace Refactoring:** Ensure the gem uses the `Pheidi` namespace (not `Pheidi::Core`).
- [ ] **Gemspec Polish:** Update descriptions, homepages, and dependencies in `pheidi-core.gemspec`.
- [ ] **Install Generator:**
    - [ ] Generate `config/initializers/pheidi.rb`.
    - [ ] Inject `pheidi_development` blocks into the host app's `database.yml`.
    - [ ] Copy isolated migrations to `db/pheidi_migrate`.
- [ ] **Outbase Connection:** Finalize `resolve_connection` logic in `Pheidi::ApplicationRecord`.
- [ ] **The "Magic" Rake Task:** Implement `pheidi:db:prepare` to handle migrations in the isolated database.

## 🚀 Phase 2: Messaging Logic (The Pace)
*Goal: Implement core business logic and polymorphic relationships.*

- [ ] **Base Models:**
    - [ ] `Pheidi::Conversation` (UUID, Slug, Metadata).
    - [ ] `Pheidi::Membership` (Polymorphic Participant, Roles).
    - [ ] `Pheidi::Message` (Polymorphic Sender, Body).
- [ ] **Participant Concern:** Create `Pheidi::Participant` to be included in host models (`User`, `Account`, etc.).
- [ ] **The Policy Hook:** Implement `Pheidi::BasePolicy` and authorization checks in controllers.
- [ ] **Internal API:** Build service objects/methods for creating conversations and managing members.

## 📡 Phase 3: Real-time & Streams (The Delivery)
*Goal: Near-instant message delivery using the Hotwire stack.*

- [ ] **Hotwire Integration:**
    - [ ] Automatic Turbo Stream broadcasts in the `Message` model.
    - [ ] `turbo_stream_from` integration in conversation views.
- [ ] **Messages Controller:** Handle message creation with Turbo Stream and JSON responses.
- [ ] **Inbox Controller:** Logic for fetching the participant's conversation list (Inboxes).
- [ ] **Optimistic UI Hooks:** Stimulus triggers to clear inputs and handle "pending" states.

## 🎨 Phase 4: Interface & DX (The Gift)
*Goal: Deliver a premium look-and-feel and a superior developer experience.*

- [ ] **Tailwind Components:**
    - [ ] Master-Detail Inbox Layout.
    - [ ] Modern Message Bubbles (Mine vs. Theirs).
    - [ ] Real-time Message Input area.
- [ ] **Stimulus Controllers:**
    - [ ] `scroll-manager`: Auto-scroll to bottom on new messages.
    - [ ] `form-reset`: Clear textarea after successful submission.
- [ ] **FTS5 Search:** Implement native full-text search for SQLite-based setups.
- [ ] **View Overrides:** Ensure developers can easily copy and customize Pheidi views.

## 🏁 Phase 5: Reliability (The Finish Line)
*Goal: Testing, documentation, and the final sprint.*

- [ ] **Testing Suite:** Build RSpec/Minitest helpers for host apps to test Pheidi integration.
- [ ] **Benchmark Suite:** Provide scripts to prove "Marathon-grade" performance.
- [ ] **Demo Script:** Finalize `bin/setup_demo` for a 60-second trial experience.
- [ ] **Documentation:** Comprehensive README covering the "Outbase" philosophy.
- [ ] **Release 1.0.0:** Deploy `pheidi-core` to RubyGems.

---

### 💡 Future Expansion (Pro & Enterprise)
- [ ] **Pro:** ActiveStorage attachments, Typing Indicators, Emoji Reactions.
- [ ] **Enterprise:** Database Sharding per Tenant, Meilisearch Adapter, Message Auditing.
