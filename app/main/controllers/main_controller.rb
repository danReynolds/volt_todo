class MainController < Volt::ModelController
  model :store # allows us to store to mongo database, _todos would be page._todos otherwise
  # page is a temp collection you can persist things to until page reload

  def index
    # Add code for when the index view is loaded
  end

  def about
    # Add code for when the about view is loaded
  end

  def todos

  end

  def add_todo
    _todos << { name: page._todo } #array of hashes, each with a name key, the value is a string
    page._todo = ""
  end

  def remove_todo(todo)
    _todos.delete(todo) # values in array were bound in view so deleting will cause view to update
  end

  def current_todo
    _todos[params._index.or(0).to_i]
  end

  private

  # the main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end
end
