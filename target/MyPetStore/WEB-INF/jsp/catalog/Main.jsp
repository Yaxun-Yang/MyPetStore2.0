<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: yyx
  Date: 2019/10/13
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp" %>
<div id="Content">

    <div id="Welcome">
        <%
        Date d=new Date();
        if(d.getHours()>=0&&d.getHours()<=6){
            out.println("Good dawn!");
        }else if(d.getHours()>6&&d.getHours()<=12){
            out.println("Good morning!");
        }else if(d.getHours()>12&&d.getHours()<=18){
            out.println("Good afternoon!");
        }else{
            out.println("Good evening!");
        }
        %>
        <br>
    </div>


    <div id="Main">
        <div id="Sidebar">
            <!--左侧导航栏-->
            <div id="SidebarContent">
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
            </div>
            </div>
        </div>



        <%--show time--%>
        <div style="position:absolute;margin-left:0px;margin-top:0px;"
                class="night-tabs night-tabs-color-default night-tabs-animation-slide-right night-tabs-position-vleft">

            <!--Tab 1-->
            <input type="radio" name="night-tabs" checked="" id="tab1" class="content1">
            <!--Checked= Tab shown-->
            <label for="tab1">
                <!--Modify icon and name--><span><span><em class="fa fa-home"></em>Welcome</span></span>
            </label>

            <!--Tab 2-->
            <input type="radio" name="night-tabs" id="tab2" class="content2">
            <label for="tab2">
                <!--Modify icon and name--><span><span><em class="fa fa-font"></em>Favorites</span></span>
            </label>
            <!--Tab 3-->
            <input type="radio" name="night-tabs" id="tab3" class="content3">
            <label for="tab3">
                <!--Modify icon and name--><span><span><em class="fa fa-list"></em>Ranking</span></span>
            </label>

            <c:if test="${account != null}">

            <!--Tab 4-->
            <input type="radio" name="night-tabs" id="tab4" class="content4">
            <label for="tab4">
                <!--Modify icon and name--><span><span><em class="fa fa-legal"></em>Chart</span></span>
            </label>
            </c:if>


            <!--Tab 12-->
            <input type="radio" name="night-tabs" id="tab12" class="content12">
            <!--Checked= Tab shown-->
            <label for="tab12">
                <!--Modify icon and name-->
                <span><span><em class="fa fa-font"></em>
               <a href="viewCategory?categoryId=FISH" style="color:#b8b8b8;"><u>Fish</u></a>
                </span></span>
            </label>

            <!--Tab 13-->
            <input type="radio" name="night-tabs"  id="tab13" class="content13">
            <!--Checked= Tab shown-->
            <label for="tab13">
                <!--Modify icon and name--><span><span><em class="fa fa-font"></em>
               <a href="viewCategory?categoryId=DOGS" style="color:#b8b8b8;"><u>Dogs</u></a>
            </span></span>
            </label>

            <!--Tab 14-->
            <input type="radio" name="night-tabs"  id="tab14" class="content14">
            <!--Checked= Tab shown-->
            <label for="tab14">
                <!--Modify icon and name--><span><span><em class="fa fa-font"></em>
           <a href="viewCategory?categoryId=CATS" style="color:#b8b8b8;"><u>Cats</u></a>
            </span></span>
            </label>

            <!--Tab 15-->
            <input type="radio" name="night-tabs" id="tab15" class="content15">
            <!--Checked= Tab shown-->
            <label for="tab15">
                <!--Modify icon and name--><span><span><em class="fa fa-font"></em>
                <a href="viewCategory?categoryId=REPTILES" style="color:#b8b8b8;"><u>Reptiles</u></a>
            </span></span>
            </label>
            <!--Tab 16-->
            <input type="radio" name="night-tabs" id="tab16" class="content16">
            <!--Checked= Tab shown-->
            <label for="tab16">
                <!--Modify icon and name--><span><span><em class="fa fa-font"></em>
            <a href="viewCategory?categoryId=BIRDS" style="color:#b8b8b8;"><u>Birds</u></a>
            </span></span>
            </label>


            <!--Content-->
            <ul class="night-tabs-content">
                <!--Tab 1-->
                <li class="content1">
                    <div class="content-1-content">
                        <!--Content goes here-->
                        <h1 class="h1">Welcome to myPetStore!</h1>
                        <p></p>
                    </div>
                </li>
                <!--Tab 2-->
                <li class="content2">
                    <div class="content-2-content">
                        <!--Content goes here-->
                        <h1 class="h1">My Favorites<br/>(We are doing!!!!!)</h1>
                        <h2 class="h2">We are doing this!!!!!</h2>

                    </div>
                </li>
                <!--Tab 3-->
                <li class="content3">
                    <div class="content-3-content">
                        <!--Content goes here-->
                        <div class="grid-row">
                            <div class="grid-column grid-column-6">
                                <h2 class="h2">Ranking</h2>
                                <p><img align="middle" src="images/cat1.gif" /></p>
                                <p><img align="middle" src="images/cat2.gif" /></p>

                            </div>


                        </div>

                    </div>
                </li>
                <!--Tab 4-->

                <li class="content4">
                    <div class="content-4-content">
                        <h1 class="h1">My Cart</h1>
                        <p><span class="dropcap">S</span>ee my chart:
                            <a href="viewCart">
                                <img align="middle" name="img_cart" src="images/cart.gif" />
                            </a>
                    </div>
                </li>
                <!--Tab 12-->
                <li class="content12">
                    <div class="content-12-content">
                        <!--Content goes here-->
                        <h1 class="h1">Saltwater, Freshwater</h1>
                        <h3 class="h3"><a href="viewProduct?productId=FI-FW-01">Koi</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=FI-FW-02">Goldfish</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=FI-SW-01">Angelfish</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=FI-SW-02">Tiger Shark</a></h3>

                    </div>
                </li>

                <!--Tab 13-->
                <li class="content13">
                    <div class="content-13-content">
                        <!--Content goes here-->
                        <h1 class="h1">Various Breeds</h1>
                        <h3 class="h3"><a href="viewProduct?productId=K9-BD-01">Bulldog</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=K9-CW-01">Chihuahua</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=K9-DL-01">Dalmation</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=K9-PO-02">Poodle</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=K9-RT-01">Golden Retriever</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=K9-RT-02">Labrador Retriever</a></h3>

                    </div>
                </li>

                <!--Tab 14-->
                <li class="content14">
                    <div class="content-14-content">
                        <!--Content goes here-->
                        <h1 class="h1">Various Breeds, Exotic Varieties</h1>
                        <h3 class="h3"><a href="viewProduct?productId=FL-DLH-02">Persian</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=FL-DSH-01">Manx</a></h3>
                    </div>
                </li>

                <!--Tab 15-->
                <li class="content15">
                    <div class="content-15-content">
                        <!--Content goes here-->
                        <h1 class="h1">Lizards, Turtles, Snakes</h1>
                        <h3 class="h3"><a href="viewProduct?productId=RP-LI-02">Iguana</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=RP-SN-01">Rattlesnake</a></h3>
                    </div>
                </li>

                <!--Tab 16-->
                <li class="content16">
                    <div class="content-16-content">
                        <!--Content goes here-->
                        <h1 class="h1">Exotic Varieties</h1>
                        <h3 class="h3"><a href="viewProduct?productId=AV-CB-01">Amazon Parrot</a></h3>
                        <h3 class="h3"><a href="viewProduct?productId=AV-SB-02">Finch</a></h3>
                    </div>
                </li>

            </ul>
        </div>


        <style>

            .night-tabs a,
            .night-tabs div,
            .night-tabs em,
            .night-tabs img,
            .night-tabs ul,
            .night-tabs label,
            .night-tabs li,
            .night-tabs ol,
            .night-tabs p,
            .night-tabs span,
            .night-tabs ul {
                border: 0;
                margin: 0;
                padding: 0;
                position: relative;
                /* CSS3 */

                box-sizing: border-box;
                /*------------------------------------*\
                #TAB LABELS
            \*------------------------------------*/
            }
            .night-tabs {
                /* Center Night Tabs; optional. */

                margin: 0 auto;
                /* Define width. */

                width: 30%;
                /* Typography */

                font: 300 0px/1.5 "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
                /* Colors */

                color: #ecf0f1;
            }
            .night-tabs input {
                display: none;
                /* Hide Checkbox. */
            }
            .night-tabs input:checked + label {
                cursor: default;
                /* Set cursor type. */
            }
            .night-tabs label {
                display: inline-block;
                z-index: 1;
                border-bottom: 2px solid #353535;
                border-right: 1px solid #444;
                /* ->>> Typography <<<-*/

                border-left: 1px solid #222;
                cursor: pointer;
                font-size: 14px;
                line-height: 30px;
                /* ->>> CSS3 <<<-*/

                text-align: left;
                /* ->>> Prevents double-click selection. <<<-*/

                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
            }
            .night-tabs label span {
                display: block;
                padding: 0.2em;
                background: #404040;
            }
            .night-tabs label span span {
                border: 2px solid transparent;
                /* CSS3*/

                padding: 0 1em;
                -webkit-transition: background 0.4s;
                transition: background 0.4s;
                /*------------------------------------*\
                #TAB CONTENT
            \*------------------------------------*/
            }
            .night-tabs .night-tabs-content {
                /* Structure */

                display: block;
                /* Typography */

                font-size: 12px;
            }
            .night-tabs .night-tabs-content > li {
                left: 0;
                opacity: 0;
                overflow: auto;
                /* ->>> Spacing for content. <<<-*/

                padding: 1em 1.5em;
                position: absolute;
                top: 0;
                visibility: hidden;
                width: 100%;
                /* Colors */
                /* CSS3 */

                background: #404040;
                -webkit-transform-origin: 0 0;
                -ms-transform-origin: 0 0;
                transform-origin: 0 0;
                /* ->>> Intensity of tab effects. <<<-*/

                -webkit-transition: all 0.8s 0.1s;
                transition: all 0.8s 0.1s;
            }
            .night-tabs > .content1:checked ~ ul > .content1,
            .night-tabs > .content2:checked ~ ul > .content2,
            .night-tabs > .content3:checked ~ ul > .content3,
            .night-tabs > .content4:checked ~ ul > .content4,
            .night-tabs > .content12:checked ~ ul > .content12,
            .night-tabs > .content13:checked ~ ul > .content13,
            .night-tabs > .content14:checked ~ ul > .content14,
            .night-tabs > .content15:checked ~ ul > .content15,
            .night-tabs > .content16:checked ~ ul > .content16{
                opacity: 1;
                /* CSS3 */

                visibility: visible;
                -webkit-transform: none;
                -ms-transform: none;
                transform: none;
                /*------------------------------------*\
                #SLIDE EFFECTS
            \*------------------------------------*/
                /* ->>> Slide Up <<<-*/
            }
            .night-tabs-animation-slide-up .night-tabs-content > li {
                -webkit-transform: translateY(30px);
                -ms-transform: translateY(30px);
                transform: translateY(30px);
                /* ->>> Slide Down <<<-*/
            }
            .night-tabs-slide-down .night-tabs-content > li {
                -webkit-transform: translateY(-30px);
                -ms-transform: translateY(-30px);
                transform: translateY(-30px);
                /* ->>> Slide Left <<<-*/
            }
            .night-tabs-animation-slide-left .night-tabs-content > li {
                -webkit-transform: translateX(-30px);
                -ms-transform: translateX(-30px);
                transform: translateX(-30px);
                /* ->>> Slide Right <<<-*/
            }
            .night-tabs-animation-slide-right .night-tabs-content > li {
                -webkit-transform: translateX(30px);
                -ms-transform: translateX(30px);
                transform: translateX(30px);
                /* ->>> Slide Up + Left <<<-*/
            }
            .night-tabs-slide-up-left .night-tabs-content > li {
                -webkit-transform: translate(-30px, -30px);
                -ms-transform: translate(-30px, -30px);
                transform: translate(-30px, -30px);
                /* ->>> Slide Up + Right <<<-*/
            }
            .night-tabs-animation-slide-up-right .night-tabs-content > li {
                -webkit-transform: translate(30px, -30px);
                -ms-transform: translate(30px, -30px);
                transform: translate(30px, -30px);
                /* ->>> Slide Down + Left <<<-*/
            }
            .night-tabs-animation-slide-down-left .night-tabs-content > li {
                -webkit-transform: translate(-30px, 30px);
                -ms-transform: translate(-30px, 30px);
                transform: translate(-30px, 30px);
                /* ->>> Slide Down + Right <<<-*/
            }
            .night-tabs-animation-slide-down-right .night-tabs-content > li {
                -webkit-transform: translate(30px, 30px);
                -ms-transform: translate(30px, 30px);
                transform: translate(30px, 30px);
                /*------------------------------------*\
                #SLIDE EFFECTS
            \*------------------------------------*/
                /* ->>> Rotate <<<-*/
            }
            .night-tabs-rotate > ul > li {
                -o-transform: rotate(10deg);
                -ms-transform: rotate(10deg);
                -moz-transform: rotate(10deg);
                -webkit-transform: rotate(10deg);
            }
            .night-tabs-animation-rotate.night-tabs.night-tabs-position-vleft > ul > li,
            .night-tabs-animation-rotate.night-tabs.night-tabs-position-vright > ul > li {
                -o-transform: rotate(-10deg);
                -ms-transform: rotate(-10deg);
                -moz-transform: rotate(-10deg);
                -webkit-transform: rotate(-10deg);
                /* ->>> Scale <<<-*/
            }
            .night-tabs-animation-scale > ul > li {
                -webkit-transform: scale(0.6, 0.6);
                -ms-transform: scale(0.6, 0.6);
                transform: scale(0.6, 0.6);
                /* ->>> Flip <<<-*/
            }
            .night-tabs-animation-flip .night-tabs-content {
                -webkit-perspective: 2000px;
                perspective: 2000px;
                -webkit-perspective-origin: 50% 50%;
                perspective-origin: 50% 50%;
            }
            .night-tabs-animation-flip .night-tabs-content > li {
                -webkit-transform: rotateX(-90deg);
                transform: rotateX(-90deg);
            }
            .night-tabs-animation-flip.night-tabs-position-vleft > .night-tabs-content > li {
                -webkit-transform: rotateY(90deg);
                transform: rotateY(90deg);
            }
            .night-tabs-animation-flip.night-tabs-position-vright > .night-tabs-content > li {
                -webkit-transform: rotateY(-90deg);
                transform: rotateY(-90deg);
                /**
             * CONTENTS - layouts.css
             *
             * HORIZONTAL POSITIONS
             * Basic horizontal positions: top, left, right, and justify.
             *
             * VERTICAL POSITIONS
             * Basic vertical positions, vertical left and vertical right.
             *
             */
                /*------------------------------------*\
                #HORIZONTAL POSITIONS
            \*------------------------------------*/
                /* ->>> Left, Center, Right <<<-*/
            }
            .night-tabs-position-left label,
            .night-tabs-position-center label,
            .night-tabs-position-right label {
                width: auto;
            }
            .night-tabs-position-left {
                text-align: left;
            }
            .night-tabs-position-center {
                text-align: center;
            }
            .night-tabs-position-right {
                text-align: right;
                /* ->>> Justified <<<-*/
            }
            .night-tabs-position-justify > input:first-child + label {
                padding-left: 0;
            }
            .night-tabs-position-justify2 > label {
                width: 50%;
            }
            .night-tabs-position-justify3 > label {
                width: 33.33%;
            }
            .night-tabs-position-justify4 > label {
                width: 25%;
                /*------------------------------------*\
                #VERTICAL POSITIONS
            \*------------------------------------*/
                /* ->>> General Styles <<<-*/
            }
            .night-tabs-position-vleft .night-tabs-content > li,
            .night-tabs-position-vright .night-tabs-content > li {
                border-top: 0;
            }
            .night-tabs-position-vleft > label,
            .night-tabs-position-vright > label {
                clear: left;
                display: block;
                float: left;
                margin-right: 0;
                width: 25%;
                /* ->>> Vertical Left <<<-*/
            }
            .night-tabs-position-vleft label {
                border-right: 2px solid #333;
            }
            .night-tabs-position-vleft > .night-tabs-content {
                margin-left: 25%;
                /* ->>> Vertical Right <<<-*/
            }
            .night-tabs-position-vright > label {
                clear: right;
                float: right;
            }
            .night-tabs-position-vright ul li {
                border-right: 1px solid #333;
            }
            .night-tabs-position-vright > .night-tabs-content {
                margin-right: 25%;
            }
            .night-tabs-position-vright .night-tabs-content > li {
                -webkit-transform-origin: 100% 0%;
                -ms-transform-origin: 100% 0%;
                transform-origin: 100% 0%;
                /**
             * CONTENTS - typography.css
             *
             * BASIC TYPOGRAPHY
             * Styles for headings,paragraphs, and links.
             *
             * EXTENDED TYPOGRAPHY
             * Styling for images, unordered and ordered lists, and utility classes.
             *
             * GRID SYSTEM
             * Basic 12 fluid column grid system with offset support.
             *
             */
                /*------------------------------------*\
                #BASIC TYPOGRAPHY
            \*------------------------------------*/
                /* ->>> Headings <<<-*/
            }
            h1,
            h2,
            h3 {
                margin: 0;
                padding: 0;
            }
            .night-tabs .night-tabs-content li .h1,
            .night-tabs .night-tabs-content li .h2,
            .night-tabs .night-tabs-content li .h3 {
                font-weight: 300;
                line-height: 1.5;
            }
            .night-tabs .night-tabs-content li .h1 {
                font-size: 2.8em;
            }
            .night-tabs .night-tabs-content li .h2 {
                font-size: 2.2em;
            }
            .night-tabs .night-tabs-content li .h3 {
                font-size: 1.4em;
                /* ->>> Paragraphs <<<-*/
            }
            .night-tabs .night-tabs-content li p {
                margin: 0.9em 0;
                font-size: 1em;
                /* ->>> Links <<<-*/
            }
            .night-tabs .night-tabs-content li a {
                color: #ecf0f1;
            }
            .night-tabs .night-tabs-content li a:hover,
            .night-tabs .night-tabs-content li a:focus {
                text-decoration: none;
                /* ->>> FontAwesome <<<-*/
            }
            .night-tabs .fa {
                margin-right: 0.5em;
                /*------------------------------------*\
                #EXTENDED TYPOGRAPHY
            \*------------------------------------*/
                /* ->>> Images <<<-*/
            }
            .night-tabs .night-tabs-content li img {
                max-width: 100%;
                height: auto;
                /* ->>> Lists <<<-*/
            }
            .night-tabs .night-tabs-ordered-list,
            .night-tabs .night-tabs-unordered-list {
                margin-top: 0.3em;
                padding-left: 2.5em;
            }
            .night-tabs .night-tabs-ordered-list {
                list-style: decimal;
            }
            .night-tabs .night-tabs-unordered-list {
                list-style: disc;
                /* ->>> Utility <<<-*/
                /* Positioning */
            }
            .text-center {
                text-align: center;
            }
            .text-left {
                text-align: left;
            }
            .text-right {
                text-align: right;
            }
            .pull-left {
                float: left;
            }
            .pull-right {
                float: right;
                /* Preformatted */
            }
            .dropcap {
                font-family: "Sanchez", Rockwell, slab-serif;
                float: left;
                font-size: 5em;
                line-height: 0.9;
            }
            .blockquote {
                margin: 1em;
                padding: 0 0 0 1em;
                border-left: 3px solid #ecf0f1;
            }
            .well {
                background: #555555;
                padding: 1em !important;
                /*------------------------------------*\
                #GRID SYSTEM
            \*------------------------------------*/
                /* ->>> Micro-Clearfix <<<-*/
            }
            .night-tabs .grid-row:after {
                content: '';
                display: table;
                clear: both;
                /* ->>> Basic Structure <<<-*/
            }
            .night-tabs .grid-row {
                margin-top: 1em;
            }
            .night-tabs .grid-row:first-child {
                margin-top: 0;
            }
            .night-tabs .grid-column {
                display: block;
                float: left;
                width: 100%;
                margin-left: 2%;
            }
            .night-tabs .grid-column:first-child {
                margin-left: 0;
                /* ->>> Grid System Config <<<-*/
            }
            .night-tabs .grid-column-1 {
                width: 6.5%;
            }
            .night-tabs .grid-column-2 {
                width: 15%;
            }
            .night-tabs .grid-column-3 {
                width: 23.5%;
            }
            .night-tabs .grid-column-4 {
                width: 32%;
            }
            .night-tabs .grid-column-5 {
                width: 40.5%;
            }
            .night-tabs .grid-column-6 {
                width: 49%;
            }
            .night-tabs .grid-column-7 {
                width: 57.5%;
            }
            .night-tabs .grid-column-8 {
                width: 66%;
            }
            .night-tabs .grid-column-9 {
                width: 74.5%;
            }
            .night-tabs .grid-column-10 {
                width: 83%;
            }
            .night-tabs .grid-column-11 {
                width: 91.5%;
            }
            .night-tabs .grid-column-offset-1,
            .night-tabs .grid-column-offset-1:first-child {
                margin-left: 8.5%;
            }
            .night-tabs .grid-column-offset-2,
            .night-tabs .grid-column-offset-2:first-child {
                margin-left: 17%;
            }
            .night-tabs .grid-column-offset-3,
            .night-tabs .grid-column-offset-3:first-child {
                margin-left: 25.5%;
            }
            .night-tabs .grid-column-offset-4,
            .night-tabs .grid-column-offset-4:first-child {
                margin-left: 34%;
            }
            .night-tabs .grid-column-offset-5,
            .night-tabs .grid-column-offset-5:first-child {
                margin-left: 42.5%;
            }
            .night-tabs .grid-column-offset-6,
            .night-tabs .grid-column-offset-6:first-child {
                margin-left: 51%;
            }
            .night-tabs .grid-column-offset-7,
            .night-tabs .grid-column-offset-7:first-child {
                margin-left: 59.5%;
            }
            .night-tabs .grid-column-offset-8,
            .night-tabs .grid-column-offset-8:first-child {
                margin-left: 68%;
            }
            .night-tabs .grid-column-offset-9,
            .night-tabs .grid-column-offset-9:first-child {
                margin-left: 76.5%;
            }
            .night-tabs .grid-column-offset-10,
            .night-tabs .grid-column-offset-10:first-child {
                margin-left: 85%;
            }
            .night-tabs .grid-column-offset-11,
            .night-tabs .grid-column-offset-11:first-child {
                margin-left: 93.5%;
                /**
             * CONTENTS - colors.css
             *
             * COLORS
             * Default (Gray/Grey), Red, Blue, Green, Purple, Orange, Yellow, Pink, Brown, Teal, Turquoise.
             *
             */
                /*------------------------------------*\
                #COLORS
            \*------------------------------------*/
                /* ->>> Default (Gray/Grey) <<<-*/
            }
            .night-tabs label:hover span span,
            .night-tabs input:checked + label span span,
            .night-tabs-color-default label:hover span span,
            .night-tabs-color-default input:checked + label span span {
                background: #6c7a89;
                /* ->>> Blue <<<-*/
            }
            .night-tabs-color-blue label:hover span span,
            .night-tabs-color-blue input:checked + label span span {
                background: #1e8bc3;
                /* ->>> Red <<<-*/
            }
            .night-tabs-color-red label:hover span span,
            .night-tabs-color-red input:checked + label span span {
                background: #ef4836;
                /* ->>> Green <<<-*/
            }
            .night-tabs-color-green label:hover span span,
            .night-tabs-color-green input:checked + label span span {
                background: #27ae60;
                /* ->>> Purple <<<-*/
            }
            .night-tabs-color-purple label:hover span span,
            .night-tabs-color-purple input:checked + label span span {
                background: #9b59b6;
                /* ->>> Orange <<<-*/
            }
            .night-tabs-color-orange label:hover span span,
            .night-tabs-color-orange input:checked + label span span {
                background: #f9690e;
                /* ->>> Yellow <<<-*/
            }
            .night-tabs-color-yellow label:hover span span,
            .night-tabs-color-yellow input:checked + label span span {
                background: #a8880a;
                /* ->>> Pink <<<-*/
            }
            .night-tabs-color-pink label:hover span span,
            .night-tabs-color-pink input:checked + label span span {
                background: #db0a5b;
                /* ->>> Brown <<<-*/
            }
            .night-tabs-color-brown label:hover span span,
            .night-tabs-color-brown input:checked + label span span {
                background: #926239;
                /* ->>> Teal <<<-*/
            }
            .night-tabs-color-teal label:hover span span,
            .night-tabs-color-teal input:checked + label span span {
                background: #008080;
                /* ->>> Turquoise <<<-*/
            }
            .night-tabs-color-turquoise label:hover span span,
            .night-tabs-color-turquoise input:checked + label span span {
                background: #16a085;
                /**
             * CONTENTS - mobile.css
             *
             * RESPONSIVE STACKING
             * Tabs stack on top of each other on mobile devices.
             *
             */
                /*------------------------------------*\
                #RESPONSIVE STACKING
            \*------------------------------------*/
            }
            @media screen and (max-width: 48em) {
                .night-tabs .grid-column,
                .night-tabs .grid-column:first-child {
                    float: none;
                    width: 100%;
                    margin: 1em 0 0 0;
                }
                .night-tabs > label {
                    display: block;
                    float: none;
                    width: 100%;
                    padding-right: 0;
                    padding-left: 0;
                    text-align: left;
                    margin: 0;
                }
                .night-tabs > .night-tabs-content {
                    margin-top: 0;
                    margin-right: 0;
                    margin-left: 0;
                }
                .night-tabs > .night-tabs-content > li {
                    -webkit-transform-origin: 50% 0%;
                    -ms-transform-origin: 50% 0%;
                    transform-origin: 50% 0%;
                }
                .night-tabs.night-tabs-animation-flip > ul > li {
                    -webkit-transform: rotateX(-90deg);
                    transform: rotateX(-90deg);
                }
            }
            body {
                background: #111;
                margin-top: 2em;
            }
        </style>


        <%--show over--%>


        <!--    展示悬浮窗-->
        <script type="text/JavaScript">

            function MM_findObj(n, d)
            { //v4.01
                var p,i,x;
                if(!d) d=document;
                if((p=n.indexOf("?"))>0&&parent.frames.length)
                {
                    d=parent.frames[n.substring(p+1)].document;
                    n=n.substring(0,p);
                }
                if(!(x=d[n])&&d.all) x=d.all[n];
                for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
                for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
                if(!x && d.getElementById) x=d.getElementById(n); return x;
            }


            function MM_showHideLayers()
            { //v6.0
                var i,p,v,obj,args=MM_showHideLayers.arguments;
                for (i=0; i<(args.length-2); i+=3)
                    if ((obj=MM_findObj(args[i]))!=null)
                    {
                        v=args[i+2];
                        if (obj.style)
                        {
                            obj=obj.style;
                            v=(v=='show')?'visible':(v=='hide')?'hidden':v;
                        }
                        obj.visibility=v;
                    }
            }
        </script>


        <div id="MainImage">
            <div id="MainImageContent">
                <!--中间显示栏-->
                <map name="estoremap">
                    <!--鼠标不经过的时候正常显示的图片-->
                    <area alt="BIRDS" coords="72,2,290,280" href="viewCategory?categoryId=BIRDS" shape="rect"
                    />

                    <area alt="FISH" coords="2,180,72,250" href="viewCategory?categoryId=FISH" shape="rect"
                          onmouseover="MM_showHideLayers('FI-SW-01','','show');MM_showHideLayers('FI-FW-01','','show');
                                       MM_showHideLayers('FI-SW-02','','show');MM_showHideLayers('FI-FW-02','','show');"
                          onmouseout="MM_showHideLayers('FI-SW-01','','hide');MM_showHideLayers('FI-FW-01','','hide');
                                      MM_showHideLayers('FI-SW-02','','hide');MM_showHideLayers('FI-FW-02','','hide');"
                    />

                    <area alt="DOGS" coords="60,250,130,320" href="viewCategory?categoryId=DOGS" shape="rect"
                          onmouseover="MM_showHideLayers('K9-BD-01','','show');MM_showHideLayers('K9-CW-01','','show');
                                        MM_showHideLayers('K9-DL-01','','show');MM_showHideLayers('K9-PO-02','','show');
                                        MM_showHideLayers('K9-RT-01','','show');MM_showHideLayers('K9-RT-02','','show');"
                          onmouseout="MM_showHideLayers('K9-BD-01','','hide');MM_showHideLayers('K9-CW-01','','hide');
                                        MM_showHideLayers('K9-DL-01','','hide');MM_showHideLayers('K9-PO-02','','hide');
                                        MM_showHideLayers('K9-RT-01','','hide');MM_showHideLayers('K9-RT-02','','hide');"

                    />
                    <area alt="REPTILES" coords="140,270,210,340" href="viewCategory?categoryId=REPTILES" shape="rect"
                          onmouseover="MM_showHideLayers('RP-LI-02','','show');MM_showHideLayers('RP-SN-01','','show');"
                          onmouseout="MM_showHideLayers('RP-LI-02','','hide');MM_showHideLayers('RP-SN-01','','hide')"
                    />
                    <area alt="CATS" coords="225,260,300,340" href="viewCategory?categoryId=CATS" shape="rect"
                          onmouseover="MM_showHideLayers('FL-DLH-02','','show');MM_showHideLayers('FL-DSH-01','','show');"
                          onmouseout="MM_showHideLayers('FL-DLH-02','','hide');MM_showHideLayers('FL-DSH-01','','hide')"
                    />
                    <area alt="BIRDS" coords="280,180,350,250" href="viewCategory?categoryId=BIRDS" shape="rect"
                          onmouseover="MM_showHideLayers('AV-CB-01','','show');MM_showHideLayers('AV-SB-02','','show');"
                          onmouseout="MM_showHideLayers('AV-CB-01','','hide');MM_showHideLayers('AV-SB-02','','hide')"
                    />
                </map>
                <!--鼠标经过的时候显示的图片-->
<%--FISH--%>
                <a href="viewProduct?productId=FI-SW-01" >
                    <img src="images/fish1.gif" class="FI-SW-01" id="FI-SW-01" width="80" height="80"
                         style="position:absolute; top:400px;left:470px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FI-SW-01','','show');"  onmouseout="MM_showHideLayers('FI-SW-01','','hide');"/>
                </a>
                <a href="viewProduct?productId=FI-SW-02" >
                    <img src="images/fish4.gif" class="FI-SW-02" id="FI-SW-02" width="80" height="80"
                         style="position:absolute; top:320px;left:465px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FI-SW-02','','show');"  onmouseout="MM_showHideLayers('FI-SW-02','','hide');"/>
                </a>
                <a href="viewProduct?productId=FI-FW-01" >
                    <img src="images/fish3.gif" class="FI-FW-01" id="FI-FW-01" width="80" height="80"
                         style="position:absolute; top:350px;left:606px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FI-FW-01','','show');"  onmouseout="MM_showHideLayers('FI-FW-01','','hide');"/>
                </a>
                <a href="viewProduct?productId=FI-FW-02" >
                    <img src="images/fish2.gif" class="FI-FW-02" id="FI-FW-02" width="80" height="80"
                         style="position:absolute; top:290px;left:540px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FI-FW-02','','show');"  onmouseout="MM_showHideLayers('FI-FW-02','','hide');"/>
                </a>
<%--DOG--%>
                <a href="viewProduct?productId=K9-CW-01" >
                    <img src="images/dog4.gif" class="K9-CW-01" id="K9-CW-01" width="80" height="80"
                         style="position:absolute; top:490px;left:655px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('K9-CW-01','','show');"  onmouseout="MM_showHideLayers('K9-CW-01','','hide');"/>
                </a>

                <a href="viewProduct?productId=K9-PO-02" >
                    <img src="images/dog6.gif" class="K9-PO-02" id="K9-PO-02" width="80" height="80"
                         style="position:absolute; top:470px;left:520px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('K9-PO-02','','show');"  onmouseout="MM_showHideLayers('K9-PO-02','','hide');"/>
                </a>

                <a href="viewProduct?productId=K9-RT-02" >
                    <img src="images/dog3.gif" class="K9-RT-02" id="K9-RT-02" width="80" height="80"
                         style="position:absolute; top:505px;left:580px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('K9-RT-02','','show');"  onmouseout="MM_showHideLayers('K9-RT-02','','hide');"/>
                </a>
<%--XIYI--%>
                <a href="viewProduct?productId=RP-LI-02" >
                    <img src="images/lizard.gif" class="RP-LI-02" id="RP-LI-02" width="80" height="80"
                         style="position:absolute; top:530px;left:640px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('RP-LI-02','','show');"  onmouseout="MM_showHideLayers('RP-LI-02','','hide');"/>
                </a>
                <a href="viewProduct?productId=RP-SN-01" >
                    <img src="images/lizard.gif" class=RP-SN-01" id="RP-SN-01" width="80" height="80"
                         style="position:absolute; top:530px;left:710px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('RP-SN-01','','show');"  onmouseout="MM_showHideLayers('RP-SN-01','','hide');"/>
                </a>
<%--CAT--%>
                <a href="viewProduct?productId=FL-DLH-02" >
                    <img src="images/cat1.gif" class=FL-DLH-02" id="FL-DLH-02" width="80" height="80"
                         style="position:absolute; top:510px;left:780px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FL-DLH-02','','show');"  onmouseout="MM_showHideLayers('FL-DLH-02','','hide');"/>
                </a>
                <a href="viewProduct?productId=FL-DSH-01" >
                    <img src="images/cat2.gif" class=FL-DSH-01" id="FL-DSH-01" width="80" height="80"
                         style="position:absolute; top:450px;left:830px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('FL-DSH-01','','show');"  onmouseout="MM_showHideLayers('FL-DSH-01','','hide');"/>
                </a>

<%--BIRDS--%>
                <a href="viewProduct?productId=AV-CB-01" >
                    <img src="images/bird2.gif" class=AV-CB-01" id="AV-CB-01" width="80" height="80"
                         style="position:absolute; top:410px;left:880px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('AV-CB-01','','show');"  onmouseout="MM_showHideLayers('AV-CB-01','','hide');"/>
                </a>
                <a href="viewProduct?productId=AV-SB-02" >
                    <img src="images/bird1.gif" class=AV-SB-02" id="AV-SB-02" width="80" height="80"
                         style="position:absolute; top:320px;left:880px;z-index:10; visibility: hidden;"
                         onmouseover="MM_showHideLayers('AV-SB-02','','show');"  onmouseout="MM_showHideLayers('AV-SB-02','','hide');"/>
                </a>




                <img height="355" src="images/splash.gif" align="middle" usemap="#estoremap" width="350" />
            </div>
        </div>

        <div id="Separator">&nbsp;</div>
    </div>

</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>