prawn_document(page_size: 'A4', page_layout: :portrait) do |pdf|
	pdf.text 'Playa Packing List', size: 18, style: :bold
	category = nil
	count = 0
	@items.each do |item|
		pdf.start_new_page if pdf.cursor < 50 && count.even?
		if category != item.category
			if category.nil?
				pdf.move_down 15
			else
				pdf.move_down 45
			end

			category = item.category
			count -= 1 if count.odd?
			pdf.text category, size: 16, style: :bold
			pdf.move_down 8
		else
			if count.even?
				pdf.move_down 30
			end
		end

		checked = item.checked
		name = item.name
		image_name = checked ? "checked.png" : "unchecked.png"

		if count.even?
			pdf.image "#{Rails.root}/app/assets/images/#{image_name}", width: 20, height: 20, at: [0, pdf.cursor]
			pdf.draw_text "#{item.name}", at: [25, pdf.cursor - 13]
		else
			pdf.image "#{Rails.root}/app/assets/images/#{image_name}", width: 20, height: 20, at: [250, pdf.cursor]
			pdf.draw_text "#{item.name}", at: [275, pdf.cursor - 13]
		end

		count += 1
  end
end