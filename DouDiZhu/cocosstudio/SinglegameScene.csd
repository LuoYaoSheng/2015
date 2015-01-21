<GameProjectFile>
  <PropertyGroup Type="Scene" Name="SinglegameScene" ID="e7468963-774b-4f89-9d84-5e0d102f878f" Version="2.0.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1" />
      <ObjectData Name="Scene" CanEdit="False" FrameEvent="" ctype="SingleNodeObjectData">
        <Position X="0" Y="0" />
        <Scale ScaleX="1" ScaleY="1" />
        <AnchorPoint />
        <CColor A="255" R="255" G="255" B="255" />
        <Size X="1024" Y="768" />
        <PrePosition X="0" Y="0" />
        <PreSize X="0" Y="0" />
        <Children>
          <NodeObjectData Name="Bg" ActionTag="66" FrameEvent="" Tag="23" ObjectIndex="5" ctype="SpriteObjectData">
            <Position X="512" Y="256" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="1024" />
            <PrePosition X="0.5" Y="0.3333333" />
            <PreSize X="0" Y="0" />
            <FileData Type="Normal" Path="bgs/BgSinglegame.png" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Basic" ActionTag="94" FrameEvent="" Tag="25" ObjectIndex="10" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="Panel_user_0" ActionTag="95" FrameEvent="" Tag="26" ObjectIndex="11" TouchEnable="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="10.35637" Y="560.1697" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0.01011364" Y="0.7293876" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="BtnHead" ActionTag="97" FrameEvent="" Tag="28" ObjectIndex="11" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                    <Position X="54.13911" Y="140.4167" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="119" />
                    <PrePosition X="0.2706956" Y="0.7020834" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="head" ActionTag="131" FrameEvent="" Tag="44" ObjectIndex="1" Scale9Width="88" Scale9Height="88" ctype="ImageViewObjectData">
                        <Position X="59.99992" Y="64.00012" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="88" Y="88" />
                        <PrePosition X="0.4999994" Y="0.5378162" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/imgPortrait02.png" />
                      </NodeObjectData>
                    </Children>
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                    <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="98" FrameEvent="" Tag="29" ObjectIndex="1" FontSize="20" LabelText="文西" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="98.81891" Y="78.23889" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0.4940946" Y="0.3911945" />
                    <PreSize X="0.9" Y="0.16" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="99" FrameEvent="" Tag="30" ObjectIndex="2" FontSize="20" LabelText="长工" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="98.81917" Y="51.37982" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0.4940958" Y="0.2568991" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="130" FrameEvent="" Tag="43" ObjectIndex="14" ctype="SpriteObjectData">
                    <Position X="176.798" Y="33.18134" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0.8839902" Y="0.1659067" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_user_1" ActionTag="132" FrameEvent="" Tag="45" ObjectIndex="12" TouchEnable="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="814.5666" Y="557.0103" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0.7954752" Y="0.7252738" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="BtnHead" ActionTag="133" FrameEvent="" Tag="46" ObjectIndex="16" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                    <Position X="148.001" Y="141.4169" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="119" />
                    <PrePosition X="0.7400049" Y="0.7070847" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="head" ActionTag="134" FrameEvent="" Tag="47" ObjectIndex="2" Scale9Width="76" Scale9Height="87" ctype="ImageViewObjectData">
                        <Position X="59.99992" Y="64.00012" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="76" Y="87" />
                        <PrePosition X="0" Y="0" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/imgPortrait03.png" />
                      </NodeObjectData>
                    </Children>
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                    <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="135" FrameEvent="" Tag="48" ObjectIndex="3" FontSize="20" LabelText="文西" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="98.81891" Y="78.23889" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="136" FrameEvent="" Tag="49" ObjectIndex="4" FontSize="20" LabelText="知县" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="98.81917" Y="51.37982" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="137" FrameEvent="" Tag="50" ObjectIndex="15" ctype="SpriteObjectData">
                    <Position X="38.00031" Y="35.18042" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0.1900015" Y="0.1759021" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_user_2" ActionTag="142" FrameEvent="" Tag="55" ObjectIndex="13" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                <Position X="413.5477" Y="73.53649" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0.4038552" Y="0.09575064" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="BtnHead" ActionTag="143" FrameEvent="" Tag="56" ObjectIndex="19" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                    <Position X="100.0018" Y="139.417" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="119" />
                    <PrePosition X="0.5000092" Y="0.6970848" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="head" ActionTag="144" FrameEvent="" Tag="57" ObjectIndex="5" Scale9Width="76" Scale9Height="87" ctype="ImageViewObjectData">
                        <Position X="59.99992" Y="64.00012" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="76" Y="87" />
                        <PrePosition X="0" Y="0" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/imgPortrait03.png" />
                      </NodeObjectData>
                    </Children>
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                    <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="145" FrameEvent="" Tag="58" ObjectIndex="5" FontSize="20" LabelText="文西" IsCustomSize="True" HorizontalAlignmentType="HT_Center" ctype="TextObjectData">
                    <Position X="98.81891" Y="78.23889" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="146" FrameEvent="" Tag="59" ObjectIndex="6" FontSize="20" LabelText="包身工" IsCustomSize="True" HorizontalAlignmentType="HT_Center" ctype="TextObjectData">
                    <Position X="98.81917" Y="51.37982" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="180" Y="32" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="147" VisibleForFrame="False" FrameEvent="" Tag="60" ObjectIndex="16" ctype="SpriteObjectData">
                    <Position X="38.00031" Y="35.18042" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
              <NodeObjectData Name="BtnStart" ActionTag="138" FrameEvent="" Tag="51" ObjectIndex="17" TouchEnable="True" FontSize="24" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="512.2104" Y="321.0109" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.5002055" Y="0.417983" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Image_3" ActionTag="140" FrameEvent="" Tag="53" ObjectIndex="3" Scale9Width="84" Scale9Height="42" ctype="ImageViewObjectData">
                    <Position X="87.8996" Y="63.19968" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="84" Y="42" />
                    <PrePosition X="0.4910592" Y="0.5962234" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/slice03_03.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnNet" ActionTag="139" FrameEvent="" Tag="52" ObjectIndex="18" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="112" Scale9Height="99" ctype="ButtonObjectData">
                <Position X="512.79" Y="583.8682" />
                <Scale ScaleX="2.0157" ScaleY="1.255352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="112" Y="99" />
                <PrePosition X="0.5007715" Y="0.760245" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Image_4" ActionTag="141" FrameEvent="" Tag="54" ObjectIndex="4" Scale9Width="182" Scale9Height="56" ctype="ImageViewObjectData">
                    <Position X="55.93991" Y="46.56918" />
                    <Scale ScaleX="0.4999998" ScaleY="0.6797985" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="182" Y="56" />
                    <PrePosition X="0.4994635" Y="0.4703958" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/imgNetNor.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="imgs/button/slice53_53.png" />
                <NormalFileData Type="Normal" Path="imgs/button/slice11_11.png" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Toolbar" ActionTag="68" FrameEvent="" Tag="100" ObjectIndex="1" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
            <Position X="162" Y="678" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="700" Y="90" />
            <PrePosition X="0.1582031" Y="0.8828125" />
            <PreSize X="0.6835938" Y="0.1171875" />
            <Children>
              <NodeObjectData Name="BgLeft" ActionTag="69" FrameEvent="" Tag="26" ObjectIndex="7" ctype="SpriteObjectData">
                <Position X="171.1806" Y="31.8634" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="364" Y="114" />
                <PrePosition X="0.2445437" Y="0.3540378" />
                <PreSize X="0" Y="0" />
                <FileData Type="Normal" Path="imgs/BgToolbar.png" />
              </NodeObjectData>
              <NodeObjectData Name="BgRight" ActionTag="70" FrameEvent="" Tag="27" ObjectIndex="8" FlipX="True" ctype="SpriteObjectData">
                <Position X="535.0557" Y="32.10999" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="364" Y="114" />
                <PrePosition X="0.7643653" Y="0.3567776" />
                <PreSize X="0" Y="0" />
                <FileData Type="Normal" Path="imgs/BgToolbar.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnMsg" ActionTag="71" FrameEvent="" Tag="100" ObjectIndex="1" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="56" Scale9Height="51" ctype="ButtonObjectData">
                <Position X="72.73709" Y="45.07843" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="56" Y="51" />
                <PrePosition X="0.1039101" Y="0.5008714" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/BtnMsgDis.png" />
                <PressedFileData Type="Normal" Path="imgs/BtnMsgSel.png" />
                <NormalFileData Type="Normal" Path="imgs/BtnMsgNor.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnRobot" ActionTag="72" FrameEvent="" Tag="101" ObjectIndex="2" FontSize="14" ButtonText="" Scale9Width="60" Scale9Height="50" DisplayState="False" ctype="ButtonObjectData">
                <Position X="168.9511" Y="46.81665" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="60" Y="50" />
                <PrePosition X="0.2413588" Y="0.520185" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/BtnRobotDis.png" />
                <PressedFileData Type="Normal" Path="imgs/BtnRobotSel.png" />
                <NormalFileData Type="Normal" Path="imgs/BtnRobotNor.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnSet" ActionTag="73" FrameEvent="" Tag="102" ObjectIndex="3" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="50" Scale9Height="53" ctype="ButtonObjectData">
                <Position X="525.5745" Y="48.06293" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="50" Y="53" />
                <PrePosition X="0.7508206" Y="0.5340325" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="imgs/BtnSetSel.png" />
                <NormalFileData Type="Normal" Path="imgs/BtnSetNor.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnBack" ActionTag="74" FrameEvent="" Tag="103" ObjectIndex="4" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="56" Scale9Height="52" ctype="ButtonObjectData">
                <Position X="622.2802" Y="44.32465" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="56" Y="52" />
                <PrePosition X="0.8889716" Y="0.4924961" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="imgs/BtnBackSel.png" />
                <NormalFileData Type="Normal" Path="imgs/BtnBackNo.png" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Back" ActionTag="75" Visible="False" VisibleForFrame="False" FrameEvent="" Tag="32" ObjectIndex="2" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="BtnClose" ActionTag="80" FrameEvent="" Tag="100" ObjectIndex="7" TouchEnable="True" FontSize="14" ButtonText="" Scale9Enable="True" Scale9Width="1" Scale9Height="1" ctype="ButtonObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="1024" Y="768" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="1" Y="1" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="bgs/clear.png" />
                <NormalFileData Type="Normal" Path="bgs/clear.png" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_Menu" ActionTag="77" FrameEvent="" Tag="34" ObjectIndex="3" TouchEnable="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="527.5772" Y="394.5924" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="330" Y="280" />
                <PrePosition X="0.5152121" Y="0.5137922" />
                <PreSize X="0.3222656" Y="0.3645833" />
                <Children>
                  <NodeObjectData Name="BtnNet" ActionTag="78" FrameEvent="" Tag="100" ObjectIndex="5" TouchEnable="True" FontSize="24" ButtonText="联网游戏" Scale9Enable="True" Scale9Width="380" Scale9Height="151" ctype="ButtonObjectData">
                    <Position X="164.4588" Y="190.9054" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="200" Y="80" />
                    <PrePosition X="0.49836" Y="0.6818051" />
                    <PreSize X="0.6060606" Y="0.2857143" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                    <NormalFileData Type="Normal" Path="Login/BtnCommon.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="BtnBack" ActionTag="79" FrameEvent="" Tag="101" ObjectIndex="6" TouchEnable="True" FontSize="24" ButtonText="返回菜单" Scale9Enable="True" Scale9Width="380" Scale9Height="151" ctype="ButtonObjectData">
                    <Position X="165.7054" Y="89.96902" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="200" Y="80" />
                    <PrePosition X="0.5021375" Y="0.3213179" />
                    <PreSize X="0" Y="0" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                    <NormalFileData Type="Normal" Path="Login/BtnCommon.png" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="25" G="79" B="137" />
                <FirstColor A="255" R="25" G="79" B="137" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Msg" ActionTag="82" Visible="False" VisibleForFrame="False" FrameEvent="" Tag="39" ObjectIndex="4" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="BtnClose" ActionTag="85" FrameEvent="" Tag="42" ObjectIndex="8" TouchEnable="True" FontSize="14" ButtonText="" Scale9Enable="True" Scale9Width="1" Scale9Height="1" ctype="ButtonObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="1024" Y="768" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="bgs/clear.png" />
                <NormalFileData Type="Normal" Path="bgs/clear.png" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_Menu" ActionTag="88" FrameEvent="" Tag="45" ObjectIndex="7" TouchEnable="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="514.3702" Y="472.4784" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0.5023147" Y="0.6152062" />
                <PreSize X="0" Y="0" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Robot" ActionTag="84" Visible="False" VisibleForFrame="False" FrameEvent="" Tag="41" ObjectIndex="6" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="BtnClose" ActionTag="86" FrameEvent="" Tag="43" ObjectIndex="9" TouchEnable="True" FontSize="14" ButtonText="" Scale9Enable="True" Scale9Width="1" Scale9Height="1" ctype="ButtonObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="1024" Y="768" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="bgs/clear.png" />
                <NormalFileData Type="Normal" Path="bgs/clear.png" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_Menu" ActionTag="89" FrameEvent="" Tag="46" ObjectIndex="8" TouchEnable="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="530.17" Y="456.6786" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0" Y="0" />
                <PreSize X="0" Y="0" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Set" ActionTag="83" Visible="False" VisibleForFrame="False" FrameEvent="" Tag="40" ObjectIndex="5" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="BtnClose" ActionTag="87" FrameEvent="" Tag="44" ObjectIndex="10" TouchEnable="True" FontSize="14" ButtonText="" Scale9Enable="True" Scale9Width="1" Scale9Height="1" ctype="ButtonObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="1024" Y="768" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="0" Y="0" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="bgs/clear.png" />
                <NormalFileData Type="Normal" Path="bgs/clear.png" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_Menu" ActionTag="90" FrameEvent="" Tag="47" ObjectIndex="9" TouchEnable="True" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                <Position X="544.3898" Y="440.8788" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="200" Y="200" />
                <PrePosition X="0" Y="0" />
                <PreSize X="0" Y="0" />
                <SingleColor A="255" R="150" G="200" B="255" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameProjectFile>