Spree::ProductsController.class_eval do
  respond_to :js, :html
  alias_method :old_show, :show

  def show
    old_show

    if request.xhr?
      respond_to do |format|
        format.html { render layout: false }
        format.js { render layout: false }
      end
    end
  end
end