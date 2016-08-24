require_relative '../test_helper'
class ToDoControllerTest < Minitest::Test
  include TestHelpers

# ================================================================================
#   Below, you will be implementing the tests that the psuedo code prescribes.
# ================================================================================

  def test_the_application_can_create_an_item
    # Send a POST request to '/items' endpoint that creates a new item
    # with a title of 'Learn to test controllers' and a description 'This is great'
    post '/items', {item: {title: "Learn to test controllers", description: "This is great"}}
    
    # Assert that the controller responds with a status of 200
    assert_equal 200, last_response.status
    # Assert that the controller responds with a body of 'Item created'
    assert_equal "Item created", last_response.body
    # Assert that the ToDo table has an item in it
    assert_equal 1, Item.count
  end

  def test_the_application_returns_all_items
    #Create multiple items
    3.times { Item.create!(title: "Learn to test controllers", description: "This is great") }
    #Send a GET request to the '/items' endpoint
    get '/items'

    parsed_response = JSON.parse(last_response.body)
    #Assert that the created items are returned in the body
    assert_equal 3, parsed_response.count
    #Assert that the controller responds with a status of 200
    assert_equal 200, last_response.status
  end

# ================================================================================
#   Below, you will be implementing the tests that the test name describes.
#   The controller action has already been implemeneted.
# ================================================================================

  def test_the_application_can_not_create_an_item_without_a_description
    post '/items', { item: {title: "Learn to test controllers"} }
    assert_equal 0, Item.count
    assert_equal 400, last_response.status
    assert_equal "Description can't be blank", last_response.body
  end


  def test_the_application_can_not_create_an_item_without_a_title
    post '/items', { item: {description: "Controllers are awesome!"} }
    assert_equal 0, Item.count
    assert_equal 400, last_response.status
    assert_equal "Title can't be blank", last_response.body
  end

# ================================================================================
#   Below, you will be implementing the tests that the psuedo code prescribes.
#   You will also need to implement the controller action.
# ================================================================================

  def test_the_application_can_update_a_previous_item_title_on_our_to_do_list
    #Create an item to test
    item = Item.create!(title: "Learn to test controllers", description: "This is great")
    #Send a PUT request to '/items/:id' that will update the item's title
    put "/items/#{item.id}", { item: { title: "Learn all the things!" } }
    #Assert that the controller responds with a status of 200
    assert_equal 200, last_response.status
    #Assert that the controller responds with a body of 'Item updated'
    assert_equal "Item updated", last_response.body
    #Assert that the item's title is the updated title and not the original title.
    item.reload
    assert_equal "Learn all the things!", item.title
  end

  def test_the_application_can_return_a_single_item
    #Create an item to test
    item = Item.create!(title: "Learn to test controllers", description: "This is great")
    # Send a GET request to '/items/:id'
    get "/items/#{item.id}"
    # Assert the controller responds with a status of 200
    assert_equal 200, last_response.status
    # Assert that the controller responds with a body of "To-Do: TaskTitle, TaskDescription"
    assert_equal "To-Do: #{item.title}, #{item.description}", last_response.body
  end

# ================================================================================
#   Below, you will be implementing the tests and the controller action
#   the test name describes.
# ================================================================================

  def test_the_application_can_update_a_previous_item_description_on_our_to_do_list
    item = Item.create!(title: "Learn to test controllers", description: "This is great")
    put "/items/#{item.id}", { item: { description: "Woohoo!" } }

    item.reload
    assert_equal 200, last_response.status
    assert_equal "Item updated", last_response.body
    assert_equal "Woohoo!", item.description
  end

  def test_the_application_can_delete_an_item
    item = Item.create!(title: "woo", description: "hola")
    delete "/items/#{item.id}"

    assert_equal 0, Item.count
    assert_equal 200, last_response.status
  end
end
