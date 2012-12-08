class IssueSweeper <ActionController::Caching::Sweeper
  observe Issue
  
  def sweep(issue)
    expire_page issues_path
    expire_page "/"
    FileUtils.rm_rf "#{page_cache_directory}/issues/"
  end
  alias_method :after_update, :sweep
  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep
end