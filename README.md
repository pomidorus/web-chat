# WEB CHAT

### Data Model

User - model to holds user email & login details
Message - model which holds messages pushed by users. Belongs to user model

### AUTH

Authentication (log in & sign up) done using devise gem. If email invalid devise will not create an account

### WS CHAT

Real time chat is done using action cable & vue js to send messages

### Weekly Stats

Weekly stats emails sends using action mailer & sidekiq scheduler. Cron config is in file sidekiq.yml (for dev purspose cron configured to run every minute).
To start sidekiq run 'sidekiq' in the terminal. To catch emails run 'mailcatcher' in the terminal

### Testing

MessagesStatsService covered by unit tests with rspec & factory_bot
