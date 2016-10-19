/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/GitHub/Digitale-klok/Digitale-klok/DigitaleKlok/deler.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1015762591_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1512U);
    t7 = *((char **)t3);
    t8 = *((int *)t7);
    t3 = (t0 + 1928U);
    t9 = *((char **)t3);
    t10 = *((int *)t9);
    t11 = (t8 == t10);
    if (t11 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t10 = (t8 + 1);
    t1 = (t0 + 3576);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t9 = (t7 + 56U);
    t12 = *((char **)t9);
    *((int *)t12) = t10;
    xsi_driver_first_trans_fast(t1);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 3576);
    t12 = (t3 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((int *)t15) = 0;
    xsi_driver_first_trans_fast(t3);
    goto LAB9;

}

static void work_a_1015762591_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = (t0 + 1928U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t7 = (t4 == t6);
    if (t7 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t15 = (t0 + 3640);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t15);

LAB2:    t20 = (t0 + 3496);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 3640);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t2 = (t0 + 1192U);
    t8 = *((char **)t2);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    t1 = t10;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_1015762591_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1015762591_3212880686_p_0,(void *)work_a_1015762591_3212880686_p_1};
	xsi_register_didat("work_a_1015762591_3212880686", "isim/Timing_TB_isim_beh.exe.sim/work/a_1015762591_3212880686.didat");
	xsi_register_executes(pe);
}
