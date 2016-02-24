class Api < Grape::API

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

end
