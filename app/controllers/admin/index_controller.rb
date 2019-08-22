class Admin::IndexController < Admin::ApplicationController
  skip_before_action :login_required, only: [:login]
    
  
  def login   
    if request.post?      
      if params[:username] == 'admin' and params[:password] == '123456'
        session[:logined] = 'yes'   
        redirect_to registers_path and return   
      end
    end
    render layout: false
  end
  
  def registers
    @registers = Register.all.order('id desc')
  end

  def show
    @register = Register.find params[:id]
  end

  def topics
    @topics = Topic.all.order('id DESC')
  end

  def add_topic
    if request.post?
      params.permit!

      ext = params[:image].original_filename.split('.').last
      filename = "#{Base64.urlsafe_encode64(SecureRandom.hex, padding: false)}.#{ext}"
      File.open("#{Rails.root}/public/topic/#{filename}", "wb+") do |f|
        f.write(params[:image].read)
      end 


      topic = Topic.new
      topic.image = filename
      topic.name = params[:name]
      topic.description = params[:description]
      topic.title = params[:title]
      topic.content = params[:content]
      topic.save
      redirect_to topics_path
    end
  end

  def delete_topic
    Topic.find(params[:id]).destroy
    redirect_to topics_path
  end

end
