# Mini TMS - Samsara Integration Example

This repository demonstrates how to integrate Samsara's Connected Operations Platform with a Transportation Management System (TMS). It showcases key integration patterns and best practices for building a modern TMS that leverages Samsara's real-time location tracking, driver safety features, and form management capabilities.

## Key Features

- **Real-time Location Tracking**: Live tracking of vehicles and drivers using Samsara's live sharing URLs
- **Driver Safety**: Integration with Samsara's driver safety features and alerts
- **Form Management**: Dynamic form templates that sync with Samsara's form system
- **Webhook Integration**: Real-time event processing from Samsara's webhook system
- **OAuth Authentication**: Secure authentication with Samsara's OAuth system

## Prerequisites

- Ruby 3.2.0 or higher
- PostgreSQL 14 or higher
- Redis (for background jobs)
- Samsara Marketplace app OAuth credentials (Client ID and Secret)

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/samsarahq/tms-sample.git
   cd tms-sample
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   bin/rails db:create db:migrate
   ```

4. Configure environment variables:

```bash
rails credentials:edit
```

Update these credentials

```yaml
secret_key_base:

samsara:
  client_id:
  client_secret:

confluent:
  bootstrap_servers: ""
  key:
  secret:
```

5. Start the development server:
   ```bash
   bin/dev
   ```

The application will be available at `http://localhost:3000`.

## Key Integration Points

### 1. OAuth Authentication
- [Auth Controller](app/controllers/auths_controller.rb): Handles Samsara OAuth flow
- [Routes](config/routes.rb): OAuth callback endpoints
- [User Model](app/models/user.rb): Stores Samsara access tokens

### 2. Real-time Location Tracking
- [Stop Model](app/models/stop.rb): Stores Samsara live sharing URLs
- [Stop Show View](app/views/stops/show.html.erb): Displays live tracking iframe
- [Location Fetching](app/controllers/locations_controller.rb): Background job for location updates

### 3. Form Management
- [Form Template Model](app/models/form_template.rb): Syncs with Samsara forms
- [Form Templates Controller](app/controllers/form_templates_controller.rb): CRUD operations
- [Form Submissions](app/models/form_submission.rb): Stores driver form responses

### 4. Webhook Integration
- [Webhooks Controller](app/controllers/webhooks_controller.rb): Processes Samsara events
- [Kafka Messages](app/models/kafka_message.rb): Stores webhook events
- [Event Processing](app/controllers/webhooks_controller.rb#process_event): Handles different event types

## Development Workflow

1. **Authentication**:
   - Visit `/auth/samsara` to start OAuth flow
   - Complete Samsara authentication
   - Access token is stored in the user record

2. **Form Templates**:
   - Create form templates at `/form_templates`
   - Templates sync with Samsara's form system
   - Assign templates to stops for driver completion

3. **Live Tracking**:
   - View live tracking at `/routes/:id/stops/:id`
   - Real-time updates via Samsara's live sharing URLs
   - Background job fetches location updates

4. **Webhook Events**:
   - View webhook events at `/webhooks`
   - Monitor Kafka messages at `/kafka_messages`
   - Events are processed asynchronously

## Testing

Run the test suite:
```bash
bin/rails test
```

## Contributing

This repository is a snapshot sample and is not accepting contributions. It is purely for reference while building your integration.

## Resources

- [Samsara API Documentation](https://developers.samsara.com/docs)
- [Samsara OAuth Guide](https://developers.samsara.com/docs/oauth)
- [Samsara Webhooks](https://developers.samsara.com/docs/webhooks)
- [Samsara Forms](https://developers.samsara.com/docs/forms)
