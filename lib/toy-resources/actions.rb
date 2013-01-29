module ToyResources::Actions

  def _index
    extract_collection
  end

  def _show
    extract_member
  end

  def _new
    extract_build
  end

  def _create
    build = extract_build
    return redirect_to vars_list, notice: 'build created' if build.save
    render :action => :new, error: 'failed to build'
  end

  def _edit
    extract_member
  end

  def _update
    member = extract_member
    return redirect_to vars_list, notice: 'member updated' if member.update_attributes params[model.to_params_symbol]
    render :action => :edit, error: 'failed to update'
  end

  def _destroy
    member = extract_member
    return redirect_to :action => :index, notice: 'member deleted' if member.destroy
    render :action => :show, error: 'failed to delete'
  end

end

ActionController::Base.send :include, ToyResources::Actions
