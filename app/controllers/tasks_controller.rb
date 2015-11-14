class TasksController < ApplicationController
  before_action :set_categories, only: %i(index)
  before_action :set_tasks, only: %i(index)

  def index
    @task = @tasks.first || Task.new
  end

  private

  def set_tasks
    @tasks = Task.when(Time.zone.today)
  end

  def set_categories
    @categories = Category.all
  end
end
