<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>


.wrapper {
    max-width: 1000px;
    margin: 0 auto
}

.wrapper:before,
.wrapper:after {
    content: '';
    display: table;
    clear: both
}

.pic {
    max-width: 300px;
    max-height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
	

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.3);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}

.pic-title {
    font-size: 1.8em
}

a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.open-down {
    -webkit-transform: rotateX(-180deg);
    -moz-transform: rotateX(-180deg);
    -o-transform: rotateX(-180deg);
    -ms-transform: rotateX(-180deg);
    transform: rotateX(-180deg);
    top: 0;
    left: 0
}

.pic:hover .open-down {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}


</style>
</head>
<body>
<!--Effect: Open Down -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=914" class="pic-image" alt="Pic">
                <span class="pic-caption open-down">
		        <h1 class="pic-title">Open Down</h1>
		        <p>Hi, this is a simple example =D</p>
		    </span>
            </div>
</body>
</html>