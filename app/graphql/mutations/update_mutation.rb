class Mutations::UpdateMutation < Mutations::BaseMutation

  def resolve(**params)
    resource = resource(params[:id])
    yield(resource) if block_given?
    if resource.save
      { resource_node => resource, :errors => [] }
    else
      failed_update_response(resource_node, resource.errors.full_messages)
    end
  rescue ActiveRecord::ActiveRecordError => e
    failed_update_response(resource_node, [e.message])
  end

  private
    def resource(id)
      resource_klass.find(id)
    end

    def resource_klass
      raise NotImplementedError, "this method must implemented in child class"
    end

    def failed_update_response(resource_name, errors = [])
      {resource_name.to_sym => nil, :errors => errors }
    end

    def resource_node
      resource_klass.to_s.downcase.to_sym
    end
end
