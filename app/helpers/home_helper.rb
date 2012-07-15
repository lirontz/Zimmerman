module HomeHelper
  def getButton text, onClickHandler
	  '<div style="width: 70px; height:29px; z-index: 3; cursor: pointer;" onclick="' + onClickHandler + '" >
	    <div style="width: 5px; height:29px; float: right; background: url(../assets/global/btnNormalRight.png) no-repeat;"></div>
	    <div style="width: 60px; height:29px; float: right; background: url(../assets/global/btnNormalBg.png);">
	      <div style="width: 100%; text-align: center; padding-top: 7px;">' + text + '</div>
	    </div>
	    <div style="width: 5px; height:29px; float: right; background: url(../assets/global/btnNormalLeft.png) no-repeat;"></div>
	  </div>'
  end
end
