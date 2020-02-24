<h1 align="center">
  VisibleBank
</h1>

<p align="center">
  <a href="#requirements">Requirements</a> •
  <a href="#how-to-use">How To Use</a> 
</p>

---

## Requirements

- `Rails 5.2.3`
- `SQLite3`

---

## How To Use

### Prerequisites

```bash
  bundle install                      # to install the used ruby gems
  rails db:create                     # to create the developemtn database if not found
  rails db:migrate                    # to apply any pending migration
  rails db:seed                       # to create the seed data
```

### Run VisibleBank

```bash
  rails s                             # the application will be in localhost:3000
```

this command will start

1- `rails` server for back-end development
