module ApplicationHelper
  def all_my_events(event)
    event.each do |event|
      concat my_events(event)
    end
  end

  def my_future_events(event)
    event.each do |event|
      concat my_events(event) if event.datetime > Time.zone.now
    end
  end

  def my_past_events(event)
    event.each do |event|
      concat my_events(event) if event.datetime < Time.zone.now
    end
  end

  def show_attendees(users)
    if users.empty?
      concat content_tag(:p, 'There are no confirmed attendees yet.', class: 'text-danger')
    else
      users.each do |user|
        concat content_tag(:li, user.name, class: 'list-style: none;')
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
      concat content_tag(:li, 'Location: ' + event.location + ' | ' + 'Date: ' + event.datetime.to_s, style: 'list-style: none;')
      concat content_tag(:a, link_to('View Event', event_path(event.id)))
      concat content_tag(:hr)
    end
  end

  def my_events(event)
    content_tag(:div, content_tag(:div, nested_div(event), class: 'card w-100 mb-3'), class: 'col-sm-3 d-flex align-items-stretch')
  end

  def nested_div(event)
    content_tag(:div, content_for_nested(event), class: 'card-body')
  end

  def content_for_nested(event)
    content_tag(:h4, event.location, class: 'card-title') +
      content_tag(:p, event.datetime, class: 'card-title') +
      (link_to 'View event', event_path(event.id))
  end
end
