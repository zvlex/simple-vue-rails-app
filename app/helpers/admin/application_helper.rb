module Admin::ApplicationHelper

  LABELS_BY_STATES_MAP = {
    draft:         'label-default',
    declined:      'label-danger',
    approved:      'label-success',
    on_moderation: 'label-warning'
  }

  def label_state_class(obj)
    LABELS_BY_STATES_MAP[obj.aasm_state.to_sym]
  end

  def current_post_link(post_version)
    if post_version.post.present?
      link_to "##{post_version.post.id}", post_path(post_version.post)
    else
      '-'
    end
  end
end
