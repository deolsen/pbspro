#!/usr/bin/sh
#
# Copyright (C) 1994-2018 Altair Engineering, Inc.
# For more information, contact Altair at www.altair.com.
#
# This file is part of the PBS Professional ("PBS Pro") software.
#
# Open Source License Information:
#
# PBS Pro is free software. You can redistribute it and/or modify it under the
# terms of the GNU Affero General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# PBS Pro is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.
# See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Commercial License Information:
#
# For a copy of the commercial license terms and conditions,
# go to: (http://www.pbspro.com/UserArea/agreement.html)
# or contact the Altair Legal Department.
#
# Altair’s dual-license business model allows companies, individuals, and
# organizations to create proprietary derivative works of PBS Pro and
# distribute them - whether embedded or bundled with other software -
# under a commercial license agreement.
#
# Use of Altair’s trademarks, including but not limited to "PBS™",
# "PBS Professional®", and "PBS Pro™" and Altair’s logos is subject to Altair's
# trademark licensing policies.

# This file will set path variables in case of ptl installation

if [ -f "/etc/debian_version" ]; then
	ptl_prefix_lib=$( dpkg -L pbspro-ptl 2>/dev/null | grep -m 1 lib$ 2>/dev/null )
else
	ptl_prefix_lib=$( rpm -ql pbspro-ptl 2>/dev/null | grep -m 1 lib$ 2>/dev/null )
fi
if [ "x${ptl_prefix_lib}" != "x" ]; then
	python_dir=$( /bin/ls -1 ${ptl_prefix_lib} )
	prefix=$( dirname ${ptl_prefix_lib} )

	export PATH=${prefix}/bin/:${PATH} 
	export PYTHONPATH=${prefix}/lib/${python_dir}/site-packages/:$PYTHONPATH 
fi
