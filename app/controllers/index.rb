get '/' do
  @categories = Category.all
  @posts = Post.all
  erb :index
end

get '/categories/:name' do
  @category = Category.where(name: params[:name]).first
  @posts = @category.posts
  erb :categories
end

get "/posts/:id" do
  # @category = Category.where(name: params[:name]).first
  @post = Post.find(params[:id])
  erb :posts
end

get "posts/new" do
  erb :new_post


