RSpec.describe Api do
  it 'works' do
    get '/', fields: [ { field1: 1 }, { field2: 2 }, { field3: 3 } ]
    ap json_response
    expect(json_response.length).to eq(3)
  end
end
