class IssuesController < ApplicationController
  caches_page :index
  before_filter(only: [:index]) { page_caching = true }
  cache_sweeper :issue_sweeper
  
  def index
    @issues = Issue.order('created_at DESC')
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new(params[:issue])

      if @issue.save
        redirect_to @issue, notice: 'Issue was successfully created.' 
      else
        render :new
    end
  end

  def update
    @issue = Issue.find(params[:id])
      if @issue.update_attributes(params[:issue])
        redirect_to issues_url, notice: 'Issue was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    redirect_to issues_url, notice: 'Issue has been deleted.'
  end
end
