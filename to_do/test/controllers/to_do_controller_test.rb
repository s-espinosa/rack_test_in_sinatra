require_relative '../test_helper'
class ToDoControllerTest < Minitest::Test
  include TestHelpers

# ================================================================================
#   Below, you will be implementing the tests that the psuedo code prescribes.
# ================================================================================

  def test_the_application_can_create_an_item
    # Send a POST request to '/items' endpoint that creates a new item
    # with a title of 'Learn to test controllers' and a description 'This is great'
    # Assert that the controller responds with a status of 200
    # Assert that the controller responds with a body of 'Item created'
    # Assert that the ToDo table has an item in it
  end

  def test_the_application_returns_all_items
    #Create multiple items
    #Send a GET request to the '/items' endpoint
    #Assert that the created items are returned in the body
    #Assert that the controller responds with a status of 200
  end

# ================================================================================
#   Below, you will be implementing the tests that the test name describes.
#   The controller action has already been implemeneted.
# ================================================================================

  def test_the_application_can_not_create_an_item_without_a_description
    #Implement the test
    #Controller action is already written.
  end


  def test_the_application_can_not_create_an_item_without_a_title
    #Implement the test
    #Controller action is already written.
  end

# ================================================================================
#   Below, you will be implementing the tests that the psuedo code prescribes.
#   You will also need to implement the controller action.
# ================================================================================

  def test_the_application_can_update_a_previous_item_title_on_our_to_do_list
    #Create an item to test
    #Send a PUT request to '/items/:id' that will update the item's title
    #Assert that the controller responds with a status of 200
    #Assert that the controller responds with a body of 'Item updated'
    #Assert that the item's title is the updated title and not the original title.
  end

  def test_the_application_can_return_a_single_item
    #Create an item to test
    # Send a GET request to '/items/:id'
    # Assert the controller responds with a status of 200
    # Assert that the controller responds with a body of "To-Do: TaskTitle, TaskDescription"
  end

# ================================================================================
#   Below, you will be implementing the tests and the controller action
#   the test name describes.
# ================================================================================

  def test_the_application_can_update_a_previous_item_description_on_our_to_do_list
    #Implement the test
    #Implement the controller action
  end

  def test_the_application_can_delete_an_item
    #Implement the test
    #Implement the controller action
  end
end
