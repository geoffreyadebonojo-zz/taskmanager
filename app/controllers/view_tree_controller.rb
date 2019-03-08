class ViewTreeController < ApplicationController
  def show
    @root = Topic.find(params[:topic_id])
    @children = @root.children
    @grandchildren = @children.map do |c|
      c.children if c.children
    end.flatten
  end

end
