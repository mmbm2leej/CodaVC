hsp = 0;

if (id.x < myleftboundary) walkdirchoice = 1;
else if (id.x > myrightboundary) walkdirchoice = -1;
else walkdirchoice = choose(-1,1);
idlechoice = choose(0,1,2);

alarm[0] = 300;