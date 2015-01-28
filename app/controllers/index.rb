get '/' do
  @categories = Category.all
  # @posts = Post.all
  erb :index
end

get '/categories/new' do

  erb :new_category
end

post '/categories/create' do
  Category.create(params[:categories])

  redirect to "/"
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts

  erb :show_categories
end

get '/categories/:id/posts/new' do
  @category = Category.find(params[:id])

  erb :new_post_for_specific_category
end

post '/categories/:id/posts' do
  @category = Category.find(params[:id])
  @post = @category.posts.create(params[:posts])

  redirect to "/posts/#{@post.id}"
end

get '/posts/new' do
  @posts = Post.all

  erb :new_post_general
end

post '/posts' do
  @categories = Category.all
  if Category.where(name: params[:posts][:category_name]) == []
    category = Category.create(name: params[:posts][:category_name])
  else
    category = Category.where(name: params[:posts][:category_name]).first
  end
    new_post = Post.create(name: params[:posts][:name], phone: params[:posts][:phone], email: params[:posts][:email], title: params[:posts][:title], description: params[:posts][:description], category_id: category.id)
    redirect to "/posts/#{new_post.id}"
end

get "/posts/:id" do
  @post = Post.find(params[:id])

  erb :show_posts
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])

  erb :edit_posts
end

patch "/posts/:id" do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:posts])

  redirect to "/posts/#{@post.id}"
end

delete "/posts/:id" do
  @post = Post.find(params[:id])
  @post.destroy

  redirect to '/'
end

delete "/categories/:id" do
  @category = Category.find(params[:id])
  @category.destroy

  redirect to '/'
end

get '/all_posts' do
  @categories = Category.all
  @posts = Post.all
  erb :all_posts
end