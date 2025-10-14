#! ../prog/BCI2000Shell
@cls & ..\..\prog\BCI2000Shell %0 %* #! && exit /b 0 || exit /b 1\n
#######################################################################################
## $Id: StimulusPresentation_SignalGenerator.bat 6137 2020-07-30 13:50:39Z mellinger $
## Description: BCI2000 startup Operator module script. For an Operator scripting
##   reference, see
##   http://doc.bci2000.org/index/User_Reference:Operator_Module_Scripting
##
## $BEGIN_BCI2000_LICENSE$
##
## This file is part of BCI2000, a platform for real-time bio-signal research.
## [ Copyright (C) 2000-2020: BCI2000 team and many external contributors ]
##
## BCI2000 is free software: you can redistribute it and/or modify it under the
## terms of the GNU General Public License as published by the Free Software
## Foundation, either version 3 of the License, or (at your option) any later
## version.
##
## BCI2000 is distributed in the hope that it will be useful, but
##                         WITHOUT ANY WARRANTY
## - without even the implied warranty of MERCHANTABILITY or FITNESS FOR
## A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along with
## this program.  If not, see <http://www.gnu.org/licenses/>.
##
## $END_BCI2000_LICENSE$
#######################################################################################
Change directory $BCI2000LAUNCHDIR
Show window; Set title ${Extract file base $0}
Reset system
Startup system localhost

Start executable SignalGenerator --local --LogKeyboard=1 --##LogEyetrackerTobiiPro=0 --##EnableGazeMonitorFilter=0 --##LogWebcam=1 --##EnableAudioExtension=1
#Start executable P3SignalProcessing --local
Start executable StimulusPresentation --local
Start executable DummySignalProcessing --local


Wait for Connected

Load parameterfile "C:\BCI2000\BCI2000 v3.6.beta.R7385\BCI2000.x64\parms\AM_task\breakout_1.prm"

#set parameter      ProgressBar 1
#set parameter      VisualizeSourceTime 8s
#set parameter      EnforceFixation 0
#set parameter      DisplayStream 1
#set parameter      RecordEyeGazeVideo 1
#set parameter      DisplayEyeGazeVideo 1

#visualize watch    CereStimStimulation
#visualize watch    KeyDown
#visualize watch    KeyUp
#visualize watch    AudioInEnvelope1
#visualize watch    StimulusCode

#visualize watch    EyetrackerLeftEyeGazeX
#visualize watch    EyetrackerRightEyeGazeX
#visualize watch    EyetrackerLeftEyeGazeY
#visualize watch    EyetrackerRightEyeGazeY
#visualize watch    EyetrackerLeftPupilSize
#visualize watch    EyetrackerRightPupilSize
#visualize watch    EyetrackerLeftEyeValidity
#visualize watch    EyetrackerRightEyeValidity