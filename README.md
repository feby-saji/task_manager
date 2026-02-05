# Offline-First Task Manager

An offline-first Task Manager application built with Flutter, structured using Clean Architecture and a feature-first approach.  
The project focuses on defining a scalable architecture for offline data handling, authentication, and future synchronization with a cloud backend.

> 🚧 **Work in Progress**  
> This repository contains partially implemented features and architectural stubs.  
> The README documents the **current implementation state** as well as the **intended design direction**.

---

## Project Overview

This application is designed to allow users to manage tasks offline, while supporting authentication and future cloud synchronization using Supabase.

At the current stage, the project establishes:
- Application bootstrapping and dependency initialization
- Authentication flow (anonymous)
- Local database schema
- App-level state management
- Navigation structure and UI scaffolding

Task management, syncing, attachments are architecturally defined but not yet implemented.

---

## Current Feature Status

### Implemented
- Supabase initialization and client setup
- Anonymous authentication flow
- Auth state listening and router-based redirection
- Local SQLite database schema
- Theme persistence (light/dark)
- Global loading overlay(progress indicator)
- Navigation shell with bottom navigation
- Profile remote upsert use case
- Core routing using `go_router`
- Placeholder UI screens for tasks, profile, and task details

### Stubbed(implementation of code that doesn't do the real work yet.)
- Google sign-in use case (defined but not implemented)
- Sign-out logic
- Task repository, data sources, and notifiers
- Profile local data source and notifier
- Sync service (interface only)
- Task UI widgets
- Database migration logic

### Not Started
- Task syncing (push/pull, conflict handling)
- Attachments handling (add, compress, upload, sync)
- Background scheduling and alarms
- Notifications
- Realtime subscriptions
- Responsive layouts

---

## Architecture

The project follows **Clean Architecture** with a **feature-first structure**.


### Presentation
- Flutter UI
- Riverpod for state management
- Navigation using `go_router`
- Ephemeral UI state via StatefulWidgets

### Domain
- Entities: `Task`, `Attachment`
- Repository abstractions for auth, profile, tasks
- Use cases for authentication and profile creation
- Failure models for error handling

### Data
- Repository implementations (auth and profile)
- Supabase remote data sources
- SQLite local database setup
- Platform-specific concerns handled here

---

## Authentication (Current)

- Supabase Authentication integrated
- Anonymous sign-in implemented
- Auth state stream drives navigation
- Google sign-in defined but not implemented
- Logout not implemented
- Session restoration relies on Supabase auth state stream

---

## Local Database

- Sqflite integrated
- Tables currently defined:
  - `profile`
  - `tasks`
  - `attachments`
  - `pendingOperations`
- Schema created on first launch
- Database migrations planned but not implemented

---

## Sync & Offline Strategy (Planned)

The intended design includes:
- Offline-first writes to SQLite
- Pending operations queue for offline changes
- Timestamp-based validation during sync
- Bidirectional sync with Supabase
- Supabase as the cloud source of truth for authenticated users

> Sync logic is not yet implemented; only structural placeholders exist.

---

## State Management

- Riverpod used for application and business state
- Implemented notifiers:
  - Authentication
  - Theme
- Stubbed notifiers:
  - Tasks
  - Profile
- Global providers for:
  - Supabase client
  - Local database
  - Router
  - Loading overlay

---

## UI & Navigation

- Screens implemented as placeholders:
  - Login
  - Main scaffold with bottom navigation
  - Task list
  - Task details
  - Profile
  - Calendar / Search (placeholder)
  - Add/Edit task modal (placeholder)
- Navigation implemented using `go_router`
- Bottom navigation implemented
- Responsive layouts not yet implemented
- Theme persistence exists; no UI toggle yet

---

## Tech Stack

### Frontend
- Flutter
- Dart
- Material 3

### State Management
- Riverpod

### Architecture
- Clean Architecture
- Feature-first folder structure

### Local Storage
- Sqflite

### Backend
- Supabase
  - Authentication
  - Database (planned)
  - Storage (planned)

### Routing
- GoRouter

---

## Contribution Notes

- Presentation layer must only interact with Domain use cases
- Domain layer must remain framework-agnostic
- Data layer handles all platform, network, and database concerns
- Errors are caught in repository implementations and mapped to domain failures
- Many modules are intentionally stubbed to establish architectural boundaries first

---

## License

MIT


