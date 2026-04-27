# Pheidi Core - Agent Guide

## Project Overview
Pheidi is a Rails engine that provides a marathon-grade messaging infrastructure.
It isolates all messaging data (messages, threads, and related metadata) from the
primary application database, supports polymorphic senders/recipients, and is
built UUID-first for distributed systems.

## Architecture at a Glance
- Rails Engine - mounted inside host Rails applications.
- Database Isolation - Messaging models live in a separate DB connection
  (SQLite / PostgreSQL / MySQL).
- Polymorphic Associations - Works with any User, Account, Bot, or custom actor
  model in the host app.
- UUID-First - All primary and foreign keys use UUIDs.
- Hotwire Native - Real-time UI updates rely on Turbo Streams; no custom
  JavaScript required.
- JSON API - Full CRUD exposed for SPAs and mobile apps.

## File Structure
- lib/ - Engine bootstrap, railtie, and gem configuration.
- app/models/ - Messaging models (Message, Thread, etc.).
- app/controllers/ - JSON API and html controllers.
- app/views/ - Turbo Stream views for Hotwire integration.
- config/ - Engine routes and initializer templates.
- db/migrate/ - Migrations for the isolated messaging database.

## Development Conventions
- Database: Always scope migrations and models to the isolated pheidi
  connection. Do not assume the host app's primary database.
- Polymorphic: Use Rails polymorphic associations for any reference to host-app
  models (sender, recipient, etc.).
- UUIDs: Prefer uuid column types for all primary keys and foreign keys. Avoid
  auto-incrementing integers.
- Hotwire: When adding UI features, prefer Turbo Streams over custom JS.
- API: Keep JSON API responses consistent and follow RESTful conventions.

## Installation & Setup
1. Add gem "pheidi-core" to the host app's Gemfile.
2. Run bundle install.
3. Run rails generate pheidi:install.
4. Run rails db:migrate:pheidi.

## Testing
- Run the test suite with standard Rails engine commands.
- Ensure tests pass against all supported database adapters (SQLite, PG, MySQL)
  where applicable.
