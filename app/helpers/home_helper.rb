module HomeHelper
  def getButton text, onClickHandler
	  '<input type="button" value="' + text + '" onclick="' + onClickHandler + '" />'
  end
end
