// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function runVideo(attach_id, video_file) {
	$.facebox('<div id="videoBox"></div>')
	flashembed("videoBox", 
      {
        src:'/flowplayer/FlowPlayerLight.swf',
		width: 468, 
		height: 350
      },
      {config: { videoFile: video_file }} 
   );
}