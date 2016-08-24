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

  get '/items/:id' do
    item = Item.find(params[:id].to_i)
    if item
      status 200
      body "To-Do: #{item.title}, #{item.description}"
    else
      status 400
    end
  end

  put '/items/:id' do
    item = Item.find(params[:id].to_i)
    item.update_attributes(params[:item])
    status 200
    body "Item updated"
  end

  delete '/items/:id' do
    Item.find(params[:id].to_i).delete
  end
end
