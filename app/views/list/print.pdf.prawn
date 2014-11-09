prawn_document(page_size: 'LETTER', page_layout: :portrait) do |pdf|
	category = nil
	@items.each do |item|
		if category != item.category
			category = item.category
			pdf.text category
		end
		checked = item.checked
		name = item.name

		if checked
			pdf.text "Completed: #{item.name}"
		else
			pdf.text "Incomplete: #{item.name}"
		end
  end
end