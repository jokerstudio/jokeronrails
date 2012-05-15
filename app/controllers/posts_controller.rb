# coding: utf-8
class PostsController < ApplicationController
  #before_filter :authenticate_user!, only: [:update,:create,:destroy,:edit,:show]
  before_filter :user_block!, only: [:update,:create,:destroy,:edit,:new]
  #before_filter :guest_block!

  #Authenticate Users
  def guest_block!     
      if current_user.blank?
        redirect_to user_session_url, alert:  "เข้าสู่ระบบก่อนใช้งาน"
      end
  end

  # def user_block!     
  #     if !current_user.try(:admin?)
  #       redirect_to root_url, alert:  "คุณไม่มีสิทธิในส่วนนี้"
  #     end
  # end
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.find(:all, :order => "updated_at")
    @posts.reverse!

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.created_at = DateTime.now
    @post.body.html_safe
    if @post.save
    redirect_to show_url(@post.id,@post.title), notice:  "บันทึกหัวข้อ #{@post.title}  เรียบร้อยแล้ว"
    end
   
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.updated_at = DateTime.now
    flash[:notice] =  "อัพเดทหัวข้อ #{@post.title} เรียบร้อย"
      if @post.update_attributes(params[:post])
        redirect_to show_url(@post.id,@post.title)
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] =  "ลบ #{@post.title} สำเร็จ"

      redirect_to root_url 
  end
end
