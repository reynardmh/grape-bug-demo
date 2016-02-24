# Demo of Grape bug

Params Array of Hash with optional fields gets squashed

Run the test

```
rspec
```

Run the app

```
rackup config.ru
```

## What is the bug about?

When we have Array of Hash with optional fields as params

```ruby
  params do
    optional :fields, type: Array do
      optional :field1, type: Integer
      optional :field2, type: Integer
      optional :field3, type: Integer
    end
  end
  get '/' do
    params.to_json
  end
```

running rspec test  with the following input

```ruby
it 'does not work' do
  get '/', fields: [ { field1: 1 }, { field2: 2 }, { field3: 3 } ]
  json_response = JSON.parse(last_response.body)
  expect(json_response)
end
```

produces this result

```
{
    "fields" => [
        [0] {
            "field1" => 1,
            "field2" => 2,
            "field3" => 3
        }
    ]
}
```

Basically it squashes the array into just one element when the previous element is missing the optional field from the next element.

The expected result

```
{
    "fields" => [
        [0] { "field1" => 1 },
        [1] { "field2" => 2 },
        [2] { "field3" => 3 }
    ]
}
```
