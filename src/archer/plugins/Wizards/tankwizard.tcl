#                T A N K W I Z A R D . T C L
# BRL-CAD
#
# Copyright (c) 2002-2025 United States Government as represented by
# the U.S. Army Research Laboratory.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public License
# version 2.1 as published by the Free Software Foundation.
#
# This library is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this file; see the file named COPYING for more
# information.
#
###
#
# Author -
#          Bob Parker
#
# Description -
#	 This is a script for loading/registering the tank wizard.
#

set brlcadDataPath [file join [bu_dir data] plugins]
# puts "pwd is [pwd], path is $brlcadDataPath"
set filename [file join $brlcadDataPath archer Wizards tankwizard TankWizard.tcl]
if { ![file exists $filename] } {
    puts "Could not load the TankWizard plugin, skipping $filename"
    return
}
source $filename

# Load only once
set pluginMajorType $TankWizard::wizardMajorType
set pluginMinorType $TankWizard::wizardMinorType
set pluginName $TankWizard::wizardName
set pluginVersion $TankWizard::wizardVersion

# check to see if already loaded
set plugin [Archer::pluginQuery $pluginName]
if {$plugin != ""} {
    if {[$plugin get -version] == $pluginVersion} {
	# already loaded ... don't bother doing it again
	return
    }
}

set iconPath ""

# register plugin with Archer's interface
Archer::pluginRegister $pluginMajorType \
    $pluginMinorType \
    $pluginName \
    "TankWizard" \
    "TankWizard.tcl" \
    "Build tank geometry (zone based)." \
    $pluginVersion \
    "SURVICE Engineering" \
    $iconPath \
    "Build a tank object" \
    "buildTank" \
    "buildTankXML"

# Local Variables:
# mode: Tcl
# tab-width: 8
# c-basic-offset: 4
# tcl-indent-level: 4
# indent-tabs-mode: t
# End:
# ex: shiftwidth=4 tabstop=8
