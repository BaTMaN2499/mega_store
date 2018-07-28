# Mega Store

The Mega Store is a simplified Ruby on Rails API app intended for usage on object-oriented design practical exercises. The project allows the exploration of various code design mistakes in a simple but more or less real-like way.

## Getting started
### Setup
```
bin/setup
```

### Running tests
```
bin/rspec
```

## The business
> Code doesn't live in a vacuum, and so shouldn't our design discussions. - Some wise person

Mega Store is a medium sized startup (think ~10 developers) with some venture capital funding, whose business is to aggregate various e-commerce into one big marketplace, thus making customer's lives easier. As an additional value offer, it also handles product deliveries.

The current efforts of the company are directed into improving its main value offer (e-commerce's aggregation and product shipping), but it's also open to trying different things if they appear solid enough.

From a product development perspective, they devoted some time to fix their initial MVP app, and now it even has automated tests! (Uh... Wow?).

Now that their business product-market fit has been found, they wish to continue paying their accumulated technical debt, but they also have a lot of features to ship, so we have to balance our time spent on refactories.

## The application
This app is an API made as lightly as possible to allow developers to focus on object-oriented design. That means we had to trim down some (very important) topics to get just the Minimum Viable Design Experience™:

### Database
We use SQLite3 here as it was the simplest database around (and the Rails default).

### Web Server
Our old WEBbrick friend returns.

### Tests
Only request specs, and not the most comprehensive ones either. The idea here just allows for refactoring exercises while keeping the application from breaking.

### Only models and controllers
Yes, we render views by `render json: object` in the controller. The purpose of this was to avoid dealing with views, (which is a very interesting topic, but can be covered in another exercise).
