dnl handle fmt checks
dnl
dnl if --with-external-fmt is supplied,
dnl use it if it is known to pkg-config and is new enough;
dnl otherwise use the included version
dnl
AC_DEFUN([AX_CHECK_FMT], [
  AC_ARG_WITH([external-fmt],
	      [AC_HELP_STRING([--with-external-fmt],
			      [use the external fmt])],
      [with_external_fmt=yes], 
      [with_external_fmt=no])
  AC_MSG_CHECKING([whether to use external fmt])
  AC_MSG_RESULT([$with_external_fmt])

  MIN_FMT_VERSION="5.3.0"

  if test "$with_external_fmt" = yes;  then
	m4_ifdef([PKG_CHECK_MODULES], [
	PKG_CHECK_MODULES([FMT], 
                          [fmt >= $MIN_FMT_VERSION])],
	[AC_MSG_ERROR([cannot use flag --with-external-fmt, the libsemigroups configure file was created on a system without m4 macros for pkg-config available...])])
  else
	AC_SUBST(FMT_CFLAGS, ['-I$(srcdir)/extern/fmt-5.3.0/include'])
  fi
])
