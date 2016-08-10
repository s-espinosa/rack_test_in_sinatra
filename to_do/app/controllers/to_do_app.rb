class ToDoApp < Sinatra::Base

  post '/items' do
    item = Item.new(params[:item])
    if item.save
      status  200
      body  "Item created"
    else
      status  400
      body  item.errors.full_messages.join(", ")
    end
  end

  get '/items' do
    body  Item.all.to_json
    status  200
  end
end
