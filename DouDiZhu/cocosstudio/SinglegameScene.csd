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
              <NodeObjectData Name="Panel_user_0" ActionTag="95" FrameEvent="" Tag="26" ObjectIndex="11" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                <Position X="0" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="512" Y="384" />
                <PrePosition X="0" Y="0.5" />
                <PreSize X="0.5" Y="0.5" />
                <Children>
                  <NodeObjectData Name="Panel_Head" ActionTag="367" FrameEvent="" Tag="151" ObjectIndex="34" TouchEnable="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="17.6073" Y="243.2602" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="120" />
                    <PrePosition X="0.03438926" Y="0.6334901" />
                    <PreSize X="0.234375" Y="0.3125" />
                    <Children>
                      <NodeObjectData Name="Yellow" ActionTag="562" VisibleForFrame="False" FrameEvent="" Tag="106" ObjectIndex="87" ctype="SpriteObjectData">
                        <Position X="60.62027" Y="60.4231" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="140" Y="140" />
                        <PrePosition X="0.5051689" Y="0.5035258" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/yellow.png" />
                      </NodeObjectData>
                      <NodeObjectData Name="BtnHead" ActionTag="97" FrameEvent="" Tag="28" ObjectIndex="11" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                        <Position X="60" Y="60" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="120" Y="119" />
                        <PrePosition X="0.5" Y="0.5" />
                        <PreSize X="0" Y="0" />
                        <Children>
                          <NodeObjectData Name="head" ActionTag="131" FrameEvent="" Tag="44" ObjectIndex="1" Scale9Width="88" Scale9Height="88" ctype="ImageViewObjectData">
                            <Position X="59.99985" Y="65.00513" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="88" Y="88" />
                            <PrePosition X="0.4999987" Y="0.5462615" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/portrait/imgPortrait02.png" />
                          </NodeObjectData>
                        </Children>
                        <TextColor A="255" R="65" G="65" B="70" />
                        <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                        <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                        <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="239" G="189" B="31" />
                    <FirstColor A="255" R="239" G="189" B="31" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="98" FrameEvent="" Tag="29" ObjectIndex="1" FontSize="20" LabelText="文西" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="120.6991" Y="226.7596" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.2357404" Y="0.5905198" />
                    <PreSize X="0.8333333" Y="0.1333333" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="99" FrameEvent="" Tag="30" ObjectIndex="2" FontSize="20" LabelText="长工" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="120.6991" Y="197.9004" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.2357404" Y="0.5153655" />
                    <PreSize X="0.8333333" Y="0.1333333" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="130" FrameEvent="" Tag="43" ObjectIndex="14" ctype="SpriteObjectData">
                    <Position X="203.6993" Y="192.5313" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0.3978503" Y="0.5013837" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="score" ActionTag="174" FrameEvent="" Tag="51" ObjectIndex="8" FontSize="20" LabelText="1399" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="120.6991" Y="165.2072" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="215" G="53" B="31" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.2357404" Y="0.4302272" />
                    <PreSize X="0.8333333" Y="0.1333333" />
                  </NodeObjectData>
                  <NodeObjectData Name="pork" ActionTag="220" VisibleForFrame="False" FrameEvent="" Tag="51" ObjectIndex="21" ctype="SpriteObjectData">
                    <Position X="29.68021" Y="156.0099" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="101" Y="140" />
                    <PrePosition X="0.05796915" Y="0.4062757" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/poker/cover_small.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="pokerNum" ActionTag="221" VisibleForFrame="False" FrameEvent="" Tag="52" ObjectIndex="15" FontSize="36" LabelText="17" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="92.87732" Y="157.9496" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="230" G="169" B="15" />
                    <Size X="80" Y="32" />
                    <PrePosition X="0.181401" Y="0.411327" />
                    <PreSize X="0.3333333" Y="0.1333333" />
                  </NodeObjectData>
                  <NodeObjectData Name="Panel_bubble" ActionTag="276" VisibleForFrame="False" FrameEvent="" Tag="60" ObjectIndex="20" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="128" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="384" Y="384" />
                    <PrePosition X="0.25" Y="0" />
                    <PreSize X="0.75" Y="1" />
                    <Children>
                      <NodeObjectData Name="Panel_bubble_short" ActionTag="473" FrameEvent="" Tag="113" ObjectIndex="39" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                        <Position X="1.954651" Y="147.0967" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="122" Y="97" />
                        <PrePosition X="0.005090237" Y="0.3830643" />
                        <PreSize X="0" Y="0" />
                        <Children>
                          <NodeObjectData Name="Sprite_30" ActionTag="474" FrameEvent="" Tag="114" ObjectIndex="75" ctype="SpriteObjectData">
                            <Position X="62.51097" Y="47.89432" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="122" Y="97" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_small.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Sprite_31" ActionTag="475" FrameEvent="" Tag="115" ObjectIndex="76" ctype="SpriteObjectData">
                            <Position X="8.915833" Y="74.17657" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="14" Y="19" />
                            <PrePosition X="0.07308059" Y="0.764707" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_img_6.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="NoCall" ActionTag="476" VisibleForFrame="False" FrameEvent="" Tag="116" ObjectIndex="77" ctype="SpriteObjectData">
                            <Position X="60" Y="50" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="67" Y="33" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_call.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Num" ActionTag="477" VisibleForFrame="False" FrameEvent="" Tag="117" ObjectIndex="78" ctype="SpriteObjectData">
                            <Position X="44.34851" Y="50.16943" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="19" Y="28" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_1.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Score" ActionTag="478" VisibleForFrame="False" FrameEvent="" Tag="118" ObjectIndex="79" ctype="SpriteObjectData">
                            <Position X="75.10553" Y="50.11948" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="35" Y="34" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                          </NodeObjectData>
                        </Children>
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="236" G="98" B="45" />
                    <FirstColor A="255" R="236" G="98" B="45" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="255" G="222" B="150" />
                <FirstColor A="255" R="255" G="222" B="150" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_user_1" ActionTag="328" FrameEvent="" Tag="112" ObjectIndex="27" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="512" Y="384" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Panel_Head" ActionTag="368" FrameEvent="" Tag="152" ObjectIndex="35" TouchEnable="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="370" Y="239.4905" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="120" />
                    <PrePosition X="0.7226563" Y="0.6236731" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="Yellow" ActionTag="563" VisibleForFrame="False" FrameEvent="" Tag="107" ObjectIndex="88" ctype="SpriteObjectData">
                        <Position X="59.09912" Y="61.94635" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="140" Y="140" />
                        <PrePosition X="0.4924927" Y="0.5162196" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/yellow.png" />
                      </NodeObjectData>
                      <NodeObjectData Name="BtnHead" ActionTag="369" FrameEvent="" Tag="153" ObjectIndex="34" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                        <Position X="60" Y="60" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="120" Y="119" />
                        <PrePosition X="0" Y="0" />
                        <PreSize X="0" Y="0" />
                        <Children>
                          <NodeObjectData Name="head" ActionTag="370" FrameEvent="" Tag="154" ObjectIndex="16" Scale9Width="87" Scale9Height="88" ctype="ImageViewObjectData">
                            <Position X="59.99985" Y="65.00513" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="87" Y="88" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/portrait/imgPortrait01.png" />
                          </NodeObjectData>
                        </Children>
                        <TextColor A="255" R="65" G="65" B="70" />
                        <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                        <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                        <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="239" G="189" B="31" />
                    <FirstColor A="255" R="239" G="189" B="31" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="331" FrameEvent="" Tag="115" ObjectIndex="34" FontSize="20" LabelText="文西" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="381.0171" Y="230.1452" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.744174" Y="0.5993366" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="332" FrameEvent="" Tag="116" ObjectIndex="35" FontSize="20" LabelText="长工" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="381.0171" Y="201.2863" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.744174" Y="0.524183" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="333" FrameEvent="" Tag="117" ObjectIndex="45" ctype="SpriteObjectData">
                    <Position X="264.02" Y="195.92" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0.515664" Y="0.5102083" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="score" ActionTag="334" FrameEvent="" Tag="118" ObjectIndex="36" FontSize="20" LabelText="1399" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="381.0171" Y="168.5933" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="215" G="53" B="31" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.744174" Y="0.439045" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="pork" ActionTag="335" VisibleForFrame="False" FrameEvent="" Tag="119" ObjectIndex="46" ctype="SpriteObjectData">
                    <Position X="460" Y="159.3948" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="101" Y="140" />
                    <PrePosition X="0.8984375" Y="0.4150905" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/poker/cover_small.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="pokerNum" ActionTag="336" VisibleForFrame="False" FrameEvent="" Tag="120" ObjectIndex="37" FontSize="36" LabelText="17" IsCustomSize="True" HorizontalAlignmentType="HT_Right" ctype="TextObjectData">
                    <Position X="400" Y="161.3357" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="230" G="169" B="15" />
                    <Size X="80" Y="32" />
                    <PrePosition X="0.78125" Y="0.4201451" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="Panel_bubble" ActionTag="337" VisibleForFrame="False" FrameEvent="" Tag="121" ObjectIndex="28" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="128" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="384" Y="384" />
                    <PrePosition X="0.25" Y="0" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="Panel_bubble_short" ActionTag="467" FrameEvent="" Tag="107" ObjectIndex="38" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                        <Position X="120.6108" Y="145.231" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="122" Y="97" />
                        <PrePosition X="0.3140906" Y="0.3782058" />
                        <PreSize X="0" Y="0" />
                        <Children>
                          <NodeObjectData Name="Sprite_30" ActionTag="468" FrameEvent="" Tag="108" ObjectIndex="70" ctype="SpriteObjectData">
                            <Position X="62.51097" Y="47.89432" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="122" Y="97" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_small.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Sprite_31" ActionTag="469" FrameEvent="" Tag="109" ObjectIndex="71" FlipX="True" ctype="SpriteObjectData">
                            <Position X="114.8357" Y="74.61963" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="14" Y="19" />
                            <PrePosition X="0.9412763" Y="0.7692745" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_img_6.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="NoCall" ActionTag="470" VisibleForFrame="False" FrameEvent="" Tag="110" ObjectIndex="72" ctype="SpriteObjectData">
                            <Position X="60" Y="50" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="67" Y="33" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_call.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Num" ActionTag="471" VisibleForFrame="False" FrameEvent="" Tag="111" ObjectIndex="73" ctype="SpriteObjectData">
                            <Position X="44.34851" Y="50.16943" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="19" Y="28" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_1.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Score" ActionTag="472" VisibleForFrame="False" FrameEvent="" Tag="112" ObjectIndex="74" ctype="SpriteObjectData">
                            <Position X="75.10553" Y="50.11948" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="35" Y="34" />
                            <PrePosition X="0" Y="0" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                          </NodeObjectData>
                        </Children>
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="236" G="98" B="45" />
                    <FirstColor A="255" R="236" G="98" B="45" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1" />
                  </NodeObjectData>
                </Children>
                <SingleColor A="255" R="195" G="149" B="27" />
                <FirstColor A="255" R="195" G="149" B="27" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1" />
              </NodeObjectData>
              <NodeObjectData Name="Panel_user_2" ActionTag="342" FrameEvent="" Tag="126" ObjectIndex="30" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                <Position X="281.0483" Y="5.834045" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="512" Y="384" />
                <PrePosition X="0.2744612" Y="0.007596413" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Panel_Head" ActionTag="374" FrameEvent="" Tag="158" ObjectIndex="37" TouchEnable="True" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="170" Y="120" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="120" Y="120" />
                    <PrePosition X="0.3320313" Y="0.3125" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="Yellow" ActionTag="564" VisibleForFrame="False" FrameEvent="" Tag="108" ObjectIndex="89" ctype="SpriteObjectData">
                        <Position X="60" Y="60" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="140" Y="140" />
                        <PrePosition X="0.5" Y="0.5" />
                        <PreSize X="0" Y="0" />
                        <FileData Type="Normal" Path="imgs/portrait/yellow.png" />
                      </NodeObjectData>
                      <NodeObjectData Name="BtnHead" CanEdit="False" ActionTag="375" FrameEvent="" Tag="159" ObjectIndex="36" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="120" Scale9Height="119" ctype="ButtonObjectData">
                        <Position X="60" Y="60" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="120" Y="119" />
                        <PrePosition X="0" Y="0" />
                        <PreSize X="0" Y="0" />
                        <Children>
                          <NodeObjectData Name="head" ActionTag="376" FrameEvent="" Tag="160" ObjectIndex="18" Scale9Width="77" Scale9Height="88" ctype="ImageViewObjectData">
                            <Position X="59.99985" Y="65.00513" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="77" Y="88" />
                            <PrePosition X="0.4999987" Y="0.5462615" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/portrait/imgPortraitBoy.png" />
                          </NodeObjectData>
                        </Children>
                        <TextColor A="255" R="65" G="65" B="70" />
                        <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                        <PressedFileData Type="Default" Path="Default/Button_Press.png" />
                        <NormalFileData Type="Normal" Path="imgs/portrait/bgPortrait.png" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="239" G="189" B="31" />
                    <FirstColor A="255" R="239" G="189" B="31" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1" />
                  </NodeObjectData>
                  <NodeObjectData Name="name" ActionTag="345" FrameEvent="" Tag="129" ObjectIndex="39" FontSize="20" LabelText="文西" IsCustomSize="True" HorizontalAlignmentType="HT_Center" ctype="TextObjectData">
                    <Position X="230" Y="101.17" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.4492188" Y="0.2634635" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="level" ActionTag="346" FrameEvent="" Tag="130" ObjectIndex="40" FontSize="20" LabelText="长工" IsCustomSize="True" HorizontalAlignmentType="HT_Center" ctype="TextObjectData">
                    <Position X="230" Y="72.30795" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="17" G="119" B="240" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.4492188" Y="0.188302" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="ok" ActionTag="347" FrameEvent="" Tag="131" ObjectIndex="49" ctype="SpriteObjectData">
                    <Position X="225.5141" Y="284.5472" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="49" Y="49" />
                    <PrePosition X="0.4404572" Y="0.7410083" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/layout/imgLayoutOk.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="score" ActionTag="348" FrameEvent="" Tag="132" ObjectIndex="41" FontSize="20" LabelText="1399" IsCustomSize="True" HorizontalAlignmentType="HT_Center" ctype="TextObjectData">
                    <Position X="230" Y="39.61448" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="215" G="53" B="31" />
                    <Size X="200" Y="32" />
                    <PrePosition X="0.4492188" Y="0.1031627" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="pork" ActionTag="349" VisibleForFrame="False" FrameEvent="" Tag="133" ObjectIndex="50" ctype="SpriteObjectData">
                    <Position X="185.4097" Y="30.41678" />
                    <Scale ScaleX="0.4" ScaleY="0.4" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="101" Y="140" />
                    <PrePosition X="0.3621283" Y="0.07921036" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/poker/cover_small.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="pokerNum" ActionTag="350" VisibleForFrame="False" FrameEvent="" Tag="134" ObjectIndex="42" FontSize="36" LabelText="17" IsCustomSize="True" ctype="TextObjectData">
                    <Position X="248.604" Y="32.35677" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="230" G="169" B="15" />
                    <Size X="80" Y="32" />
                    <PrePosition X="0.4855546" Y="0.08426242" />
                    <PreSize X="0" Y="0" />
                  </NodeObjectData>
                  <NodeObjectData Name="Panel_bubble" ActionTag="351" VisibleForFrame="False" FrameEvent="" Tag="135" ObjectIndex="31" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                    <Position X="128" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="384" Y="384" />
                    <PrePosition X="0.25" Y="0" />
                    <PreSize X="0" Y="0" />
                    <Children>
                      <NodeObjectData Name="Panel_bubble_short" ActionTag="352" FrameEvent="" Tag="136" ObjectIndex="32" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
                        <Position X="165.2235" Y="190.3497" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <AnchorPoint />
                        <CColor A="255" R="255" G="255" B="255" />
                        <Size X="122" Y="97" />
                        <PrePosition X="0.4302696" Y="0.4957023" />
                        <PreSize X="0.3177083" Y="0.2526042" />
                        <Children>
                          <NodeObjectData Name="Sprite_30" ActionTag="353" FrameEvent="" Tag="137" ObjectIndex="51" ctype="SpriteObjectData">
                            <Position X="62.51097" Y="47.89432" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="122" Y="97" />
                            <PrePosition X="0.512385" Y="0.4937558" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_small.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Sprite_31" ActionTag="354" FrameEvent="" Tag="138" ObjectIndex="52" FlipY="True" ctype="SpriteObjectData">
                            <Position X="7.915817" Y="27.17588" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="14" Y="19" />
                            <PrePosition X="0.06488375" Y="0.2801637" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_img_6.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="NoCall" ActionTag="464" VisibleForFrame="False" FrameEvent="" Tag="104" ObjectIndex="67" ctype="SpriteObjectData">
                            <Position X="60" Y="50" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="67" Y="33" />
                            <PrePosition X="0.4918033" Y="0.5154639" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_chat_call.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Num" ActionTag="465" VisibleForFrame="False" FrameEvent="" Tag="105" ObjectIndex="68" ctype="SpriteObjectData">
                            <Position X="44.34851" Y="50.16943" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="19" Y="28" />
                            <PrePosition X="0.3635124" Y="0.5172107" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_1.png" />
                          </NodeObjectData>
                          <NodeObjectData Name="Score" ActionTag="466" VisibleForFrame="False" FrameEvent="" Tag="106" ObjectIndex="69" ctype="SpriteObjectData">
                            <Position X="75.10553" Y="50.11948" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <Size X="35" Y="34" />
                            <PrePosition X="0.6156191" Y="0.5166957" />
                            <PreSize X="0" Y="0" />
                            <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                          </NodeObjectData>
                        </Children>
                        <SingleColor A="255" R="150" G="200" B="255" />
                        <FirstColor A="255" R="150" G="200" B="255" />
                        <EndColor A="255" R="255" G="255" B="255" />
                        <ColorVector ScaleY="1" />
                      </NodeObjectData>
                    </Children>
                    <SingleColor A="255" R="236" G="98" B="45" />
                    <FirstColor A="255" R="236" G="98" B="45" />
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
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_Bubble" ActionTag="362" Visible="False" FrameEvent="" Tag="146" ObjectIndex="33" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="BtnStart" ActionTag="363" FrameEvent="" Tag="100" ObjectIndex="32" TouchEnable="True" FontSize="24" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="508.4676" Y="285.3534" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.4965504" Y="0.3715539" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Image_3" ActionTag="364" FrameEvent="" Tag="148" ObjectIndex="14" Scale9Width="84" Scale9Height="42" ctype="ImageViewObjectData">
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
              <NodeObjectData Name="BtnNet" ActionTag="365" FrameEvent="" Tag="101" ObjectIndex="33" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="112" Scale9Height="99" ctype="ButtonObjectData">
                <Position X="515.0588" Y="585.9162" />
                <Scale ScaleX="2.0157" ScaleY="1.255352" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="112" Y="99" />
                <PrePosition X="0.5029871" Y="0.7629117" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Image_4" ActionTag="366" FrameEvent="" Tag="150" ObjectIndex="15" Scale9Width="182" Scale9Height="56" ctype="ImageViewObjectData">
                    <Position X="55.93991" Y="46.56918" />
                    <Scale ScaleX="0.4999998" ScaleY="0.6797985" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="182" Y="56" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/imgNetNor.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" />
                <PressedFileData Type="Normal" Path="imgs/button/slice53_53.png" />
                <NormalFileData Type="Normal" Path="imgs/button/slice11_11.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnNoCall" ActionTag="439" VisibleForFrame="False" FrameEvent="" Tag="102" ObjectIndex="37" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="224.5901" Y="299.381" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.2193262" Y="0.3898189" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55" ActionTag="444" FrameEvent="" Tag="84" ObjectIndex="55" ctype="SpriteObjectData">
                    <Position X="87.70061" Y="62.98495" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="67" Y="33" />
                    <PrePosition X="0.4899475" Y="0.5941976" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_chat_call.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnOne" ActionTag="451" VisibleForFrame="False" FrameEvent="" Tag="103" ObjectIndex="44" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="527.4077" Y="302.1218" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.5150466" Y="0.3933878" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55_Copy" ActionTag="452" FrameEvent="" Tag="92" ObjectIndex="59" ctype="SpriteObjectData">
                    <Position X="75.34778" Y="64.69104" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="19" Y="28" />
                    <PrePosition X="0.4209373" Y="0.6102929" />
                    <PreSize X="0.3743017" Y="0.3113208" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_1.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="Sprite_55_Copy_Copy" ActionTag="457" FrameEvent="" Tag="97" ObjectIndex="62" ctype="SpriteObjectData">
                    <Position X="112.9322" Y="64.16546" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="35" Y="34" />
                    <PrePosition X="0.6309063" Y="0.6053345" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnTwo" ActionTag="458" VisibleForFrame="False" FrameEvent="" Tag="104" ObjectIndex="47" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="717.6424" Y="298.8277" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.7008227" Y="0.3890986" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55" ActionTag="459" FrameEvent="" Tag="99" ObjectIndex="63" ctype="SpriteObjectData">
                    <Position X="75.34778" Y="64.69104" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="20" Y="28" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_2.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="Sprite_55_" ActionTag="460" FrameEvent="" Tag="100" ObjectIndex="64" ctype="SpriteObjectData">
                    <Position X="112.9322" Y="64.16546" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="35" Y="34" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="Btnhree" ActionTag="461" VisibleForFrame="False" FrameEvent="" Tag="105" ObjectIndex="48" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="910.3479" Y="298.0043" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.8890116" Y="0.3880264" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite" ActionTag="462" FrameEvent="" Tag="102" ObjectIndex="65" ctype="SpriteObjectData">
                    <Position X="75.34778" Y="64.69104" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="19" Y="29" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_3.png" />
                  </NodeObjectData>
                  <NodeObjectData Name="Sprite_" ActionTag="463" FrameEvent="" Tag="103" ObjectIndex="66" ctype="SpriteObjectData">
                    <Position X="112.9322" Y="64.16546" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="35" Y="34" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_num_score.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnCheck" ActionTag="551" VisibleForFrame="False" FrameEvent="" Tag="106" ObjectIndex="49" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="224.9401" Y="301.7311" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.2196681" Y="0.392879" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55_Copy" ActionTag="552" FrameEvent="" Tag="96" ObjectIndex="80" ctype="SpriteObjectData">
                    <Position X="87.70061" Y="62.98495" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="71" Y="33" />
                    <PrePosition X="0" Y="0" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/bubble/bubble_chat_out.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnReset" ActionTag="553" VisibleForFrame="False" FrameEvent="" Tag="107" ObjectIndex="50" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="527.7568" Y="302.1214" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.5153875" Y="0.3933872" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55" ActionTag="554" FrameEvent="" Tag="98" ObjectIndex="81" ctype="SpriteObjectData">
                    <Position X="92.97504" Y="64.69101" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="84" Y="42" />
                    <PrePosition X="0.5194136" Y="0.6102926" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/slice09_09.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnHint" ActionTag="556" VisibleForFrame="False" FrameEvent="" Tag="108" ObjectIndex="51" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="716.4658" Y="302.3527" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.6996737" Y="0.3936884" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite_55" ActionTag="557" FrameEvent="" Tag="101" ObjectIndex="83" ctype="SpriteObjectData">
                    <Position X="91.0993" Y="65.51569" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="84" Y="42" />
                    <PrePosition X="0.5089347" Y="0.6180725" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/imgHintNor.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
              <NodeObjectData Name="BtnPull" ActionTag="559" VisibleForFrame="False" FrameEvent="" Tag="109" ObjectIndex="52" TouchEnable="True" FontSize="14" ButtonText="" Scale9Width="179" Scale9Height="106" ctype="ButtonObjectData">
                <Position X="910.3472" Y="301.5294" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="179" Y="106" />
                <PrePosition X="0.889011" Y="0.3926164" />
                <PreSize X="0" Y="0" />
                <Children>
                  <NodeObjectData Name="Sprite" ActionTag="560" FrameEvent="" Tag="104" ObjectIndex="85" ctype="SpriteObjectData">
                    <Position X="94.15039" Y="62.34067" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <Size X="81" Y="42" />
                    <PrePosition X="0.5259798" Y="0.5881195" />
                    <PreSize X="0" Y="0" />
                    <FileData Type="Normal" Path="imgs/button/pull.png" />
                  </NodeObjectData>
                </Children>
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <PressedFileData Type="Normal" Path="imgs/button/btnGreen.png" />
                <NormalFileData Type="Normal" Path="imgs/button/btnBlue.png" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Panel_handle" ActionTag="273" Visible="False" VisibleForFrame="False" FrameEvent="" Tag="57" ObjectIndex="19" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
            <Position X="512" Y="384" />
            <Scale ScaleX="1" ScaleY="1" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="1024" Y="768" />
            <PrePosition X="0.5" Y="0.5" />
            <PreSize X="1" Y="1" />
            <Children>
              <NodeObjectData Name="Sprite_28" ActionTag="274" Visible="False" FrameEvent="" Tag="58" ObjectIndex="28" ctype="SpriteObjectData">
                <Position X="512" Y="384" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="1024" Y="768" />
                <PrePosition X="0.5" Y="0.5" />
                <PreSize X="0" Y="0" />
                <FileData Type="Normal" Path="bgs/IMG_0079.PNG" />
              </NodeObjectData>
            </Children>
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1" />
          </NodeObjectData>
          <NodeObjectData Name="Toolbar" ActionTag="68" Visible="False" FrameEvent="" Tag="100" ObjectIndex="1" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
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
                <FileData Type="Normal" Path="imgs/toolbar/BgToolbar.png" />
              </NodeObjectData>
              <NodeObjectData Name="BgRight" ActionTag="70" FrameEvent="" Tag="27" ObjectIndex="8" FlipX="True" ctype="SpriteObjectData">
                <Position X="535.0557" Y="32.10999" />
                <Scale ScaleX="1" ScaleY="1" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <CColor A="255" R="255" G="255" B="255" />
                <Size X="364" Y="114" />
                <PrePosition X="0.7643653" Y="0.3567776" />
                <PreSize X="0" Y="0" />
                <FileData Type="Normal" Path="imgs/toolbar/BgToolbar.png" />
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
                <DisabledFileData Type="Normal" Path="imgs/toolbar/BtnMsgDis.png" />
                <PressedFileData Type="Normal" Path="imgs/toolbar/BtnMsgSel.png" />
                <NormalFileData Type="Normal" Path="imgs/toolbar/BtnMsgNor.png" />
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
                <DisabledFileData Type="Normal" Path="imgs/toolbar/BtnRobotDis.png" />
                <PressedFileData Type="Normal" Path="imgs/toolbar/BtnRobotSel.png" />
                <NormalFileData Type="Normal" Path="imgs/toolbar/BtnRobotNor.png" />
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
                <PressedFileData Type="Normal" Path="imgs/toolbar/BtnSetSel.png" />
                <NormalFileData Type="Normal" Path="imgs/toolbar/BtnSetNor.png" />
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
                <PressedFileData Type="Normal" Path="imgs/toolbar/BtnBackSel.png" />
                <NormalFileData Type="Normal" Path="imgs/toolbar/BtnBackNo.png" />
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