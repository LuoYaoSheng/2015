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
          <NodeObjectData Name="Panel_Back" ActionTag="75" VisibleForFrame="False" FrameEvent="" Tag="32" ObjectIndex="2" TouchEnable="True" BackColorAlpha="0" ColorAngle="90" ctype="PanelObjectData">
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
          <NodeObjectData Name="Panel_Msg" ActionTag="82" VisibleForFrame="False" FrameEvent="" Tag="39" ObjectIndex="4" TouchEnable="True" BackColorAlpha="102" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
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
          <NodeObjectData Name="Panel_Robot" ActionTag="84" VisibleForFrame="False" FrameEvent="" Tag="41" ObjectIndex="6" TouchEnable="True" BackColorAlpha="102" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
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
          <NodeObjectData Name="Panel_Set" ActionTag="83" VisibleForFrame="False" FrameEvent="" Tag="40" ObjectIndex="5" TouchEnable="True" BackColorAlpha="102" ColorAngle="90" Scale9Enable="True" ctype="PanelObjectData">
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