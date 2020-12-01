module ApplicationHelper
  def all_my_events(event)
    event.each do |ev|
      concat my_events(ev)
    end
  end

  def my_future_events(event)
    event.each do |ev|
      concat my_events(ev) if ev.datetime > Time.zone.now
    end
  end

  def my_past_events(event)
    event.each do |ev|
      concat my_events(ev) if ev.datetime < Time.zone.now
    end
  end

  def show_attendees(users)
    if users.empty?
      concat content_tag(:p, 'There are no confirmed attendees yet.', class: 'text-danger mt-4')
    else
      users.each do |user|
        concat content_tag(:li, user.name, class: 'list-group-item font-weight-bold font-italic')
      end
    end
  end

  def assistance_btn(event)
    if signed_in? && !check_assistance(current_user[:id], event)
      concat render 'assist_btn'
    elsif signed_in? && check_assistance(current_user[:id], event)
      concat render 'unassist_btn'
    end
  end

  def list_events(events)
    events.each do |event|
      concat content_tag(:li, "Location: #{event.location}", style: 'list-style: none;')
      concat content_tag(:li, "Date: #{event.datetime.strftime("On %m/%d/%Y, at %I:%M%p")}", style: 'list-style: none;')
      concat content_tag(:p, "#{event.attendees.count} attendees" , class: 'small text-muted')
      concat content_tag(:a, link_to('View Attendees', event_path(event.id), class: 'badge badge-primary'))
      concat content_tag(:span, '  ')
      if event.author == current_user
        concat content_tag(:a, link_to('Delete', event_path(event.id), method: :delete, data: { confirm: 'Are you sure?' }, class: 'badge badge-danger')) unless current_user.nil?
      end
      # if signed_in? && check_assistance(current_user[:id], event)
      #   concat content_tag(:span, '  ')
      #   concat render 'unassist_btn'
      # elsif signed_in? && !check_assistance(current_user[:id], event)
      #   concat content_tag(:span, '  ')
      #   concat render 'assist_btn'
      # end
      concat content_tag(:hr)
    end
  end

  def my_events(event)
    content_tag(:div, content_tag(:div, nested_div(event), class: 'card w-100 mb-3'),
                class: 'col-sm-3 d-flex align-items-stretch')
  end

  def nested_div(event)
    content_tag(:div, content_for_nested(event),
                class: 'card-body')
  end

  def content_for_nested(event)
    content_tag(:h4, "<span class='small'>Location:</span> #{event.location}".html_safe, class: 'card-title') +
      content_tag(:p, event.datetime.strftime("On %m/%d/%Y, at %I:%M%p"), class: 'card-title') +
        content_tag(:p, "#{event.attendees.count} attendees" , class: 'small text-muted') +
        (link_to 'View event', event_path(event.id), class: 'badge badge-primary') + '  ' +
        (link_to 'Delete', event_path(event.id), method: :delete, class: 'badge badge-danger')
  end
end
