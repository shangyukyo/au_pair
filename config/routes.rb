Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :welcome do 
    collection do
      get :index_zuixin_zhiwei
      get :index_jiating_daibiao
      get :index_fukuan
      get :huhui_jiating_shenqing_tiaojian
      get :huhui_jiating_feiyong_biaozhun
      get :huhui_jiating_huhui_jihua
      get :huhui_jiating_huhui_shenghuo
      get :huhui_jiating_huhui_fenxi
      get :huhui_jiating_faq

      get :waiguo_huhui_about_aupair
      get :waiguo_huhui_zeren_yiwu
      get :waiguo_huhui_zuoyong_jiazhi
      get :waiguo_huhui_shijian_anpai
      get :waiguo_huhui_xiangmu_duibi
      get :waiguo_huhui_beijing_hanyuan
      
      get :contact_us
      get :register
      get :topic
      post :register
      post :add_contact
    end
  end


  scope :admin, module: 'admin' do 
    scope shallow_path: 'index',  controller: 'index' do
      get  :login
      post :login

      get :registers
      get :show
      get  :topics
      get  :add_topic
      post :add_topic
      get  :edit_topic
      post :update_topic
      get  :delete_topic
      get  :delete_contact
      get  :delete_register
      get  :contacts
    end
  end  


end
