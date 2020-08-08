class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @title = '关于我们'
  end

  def index_jiating_daibiao
    @title = '家庭代表'
  end

  def index_zuixin_zhiwei
    @title = '最新职位'
  end

  def index_fukuan  
    @title = '如何付款'  
  end

  def huhui_jiating_shenqing_tiaojian
    @title = '申请条件和流程'
  end

  def huhui_jiating_feiyong_biaozhun
    @title = '费用标准和说明'
  end

  def huhui_jiating_huhui_jihua
    @title = '家庭互惠计划'
  end

  def huhui_jiating_huhui_shenghuo
    @title = '家庭互惠生活'
  end

  def huhui_jiating_huhui_fenxi
    @title = '各国互惠生分析'
  end

  def huhui_jiating_faq
    @title = '常见问题'
  end



  def waiguo_huhui_about_aupair
    @title = '什么是Aupair(互惠生)'
  end

  def waiguo_huhui_zeren_yiwu
    @title = '与互惠生交谈'
  end

  def waiguo_huhui_zuoyong_jiazhi
    @title = '作用和价值'
  end

  def waiguo_huhui_shijian_anpai
    @title = '时间安排'
  end
  

  def waiguo_huhui_xiangmu_duibi
    @title = '项目对比'
  end

  def waiguo_lietou_shoufei_qingkuang
    @title = '外国猎头-收费情况'
  end

  def contact_us
    @title = "联系我们"
  end

  def add_contact
    c = Contact.new
    c.name = params[:name]
    c.gender = params[:gender]
    c.city = params[:city]
    c.other_city = params[:other_city]
    c.range_time = params[:range_time]
    c.email = params[:email]
    c.mobile = params[:mobile]
    c.wechat = params[:wechat]
    c.content = params[:content]
    c.save
    redirect_to contact_us_welcome_index_path
  end

  def topic
    @t = Topic.find params[:id]
    render layout: false
  end

  def register
    if request.post?
      params.permit!

      if params[:jianli_path].present?
        ext = params[:jianli_path].original_filename.split('.').last
        filename = "#{Base64.urlsafe_encode64(SecureRandom.hex, padding: false)}.#{ext}"
        File.open("#{Rails.root}/public/jianli/#{filename}", "wb+") do |f|
          f.write(params[:jianli_path].read)
        end 
      end

      r = Register.new
      r.name = params[:name]
      r.gender = params[:gender]
      r.marriage = params[:marriage]
      r.email = params[:email]
      r.minzu = params[:minzu]
      r.age = params[:age]
      r.zhengzhi = params[:zhengzhi]
      r.jiguan = params[:jiguan]
      r.wenhuachengdu = params[:wenhuachengdu]
      r.biyexuexiao = params[:biyexuexiao]
      r.zhuanye = params[:zhuanye]
      r.biyeshijian = params[:biyeshijian]
      r.waiyushuiping = params[:waiyushuiping]
      r.yingpinzhiwei = params[:yingpinzhiwei]
      r.lianxidianhua = params[:lianxidianhua]
      r.jianli = params[:jianli]
      r.jianli_path = filename
      r.save
    end
  end


end