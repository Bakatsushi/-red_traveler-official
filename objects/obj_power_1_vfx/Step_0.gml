
if global.levelUp == true {
	
	exit;
}

// efeito do poder
image_xscale = scale;
image_yscale = scale;

scale -= .05;

if scale <= 0 {
	
	instance_destroy();
}