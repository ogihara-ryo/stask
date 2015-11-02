class TasksController < ApplicationController
  before_action :set_categories, only: %i(index)
  before_action :set_tasks, only: %i(index)

  def index
    @task = Task.first
  end

  private

  def set_tasks
    @tasks = Task.all
  end

  def set_categories
    @categories = Category.all
  end
end
