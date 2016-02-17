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
static const char *ng0 = "C:/Xilinx/Projets/AES_Group_3/AES_Group_3/Sbox/TestBlocks/TB_Bit4Mul.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0010039159_2372691052_p_0(char *t0)
{
    char t11[16];
    char t16[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    t1 = (t0 + 2512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 4932);
    *((int *)t2) = 0;
    t4 = (t0 + 4936);
    *((int *)t4) = 16;
    t5 = 0;
    t6 = 16;

LAB8:    if (t5 <= t6)
        goto LAB9;

LAB11:    xsi_set_current_line(91, ng0);

LAB28:    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(82, ng0);
    t7 = (t0 + 4940);
    *((int *)t7) = 0;
    t8 = (t0 + 4944);
    *((int *)t8) = 16;
    t9 = 0;
    t10 = 16;

LAB12:    if (t9 <= t10)
        goto LAB13;

LAB15:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 4880U);
    t7 = (t0 + 4952);
    t12 = (t16 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 3;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t9 = (3 - 0);
    t20 = (t9 * 1);
    t20 = (t20 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t20;
    t13 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t11, t4, t2, t7, t16);
    t14 = (t11 + 12U);
    t20 = *((unsigned int *)t14);
    t22 = (1U * t20);
    t23 = (4U != t22);
    if (t23 == 1)
        goto LAB23;

LAB24:    t15 = (t0 + 2960);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t21 = (t18 + 56U);
    t24 = *((char **)t21);
    memcpy(t24, t13, 4U);
    xsi_driver_first_trans_fast(t15);

LAB10:    t2 = (t0 + 4932);
    t5 = *((int *)t2);
    t4 = (t0 + 4936);
    t6 = *((int *)t4);
    if (t5 == t6)
        goto LAB11;

LAB25:    t9 = (t5 + 1);
    t5 = t9;
    t7 = (t0 + 4932);
    *((int *)t7) = t5;
    goto LAB8;

LAB13:    xsi_set_current_line(84, ng0);
    t12 = (t0 + 1032U);
    t13 = *((char **)t12);
    t12 = (t0 + 4864U);
    t14 = (t0 + 4948);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 3;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (3 - 0);
    t20 = (t19 * 1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t18 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t11, t13, t12, t14, t16);
    t21 = (t11 + 12U);
    t20 = *((unsigned int *)t21);
    t22 = (1U * t20);
    t23 = (4U != t22);
    if (t23 == 1)
        goto LAB16;

LAB17:    t24 = (t0 + 2896);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t18, 4U);
    xsi_driver_first_trans_fast(t24);
    xsi_set_current_line(86, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t3);

LAB20:    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB14:    t2 = (t0 + 4940);
    t9 = *((int *)t2);
    t4 = (t0 + 4944);
    t10 = *((int *)t4);
    if (t9 == t10)
        goto LAB15;

LAB22:    t19 = (t9 + 1);
    t9 = t19;
    t7 = (t0 + 4940);
    *((int *)t7) = t9;
    goto LAB12;

LAB16:    xsi_size_not_matching(4U, t22, 0);
    goto LAB17;

LAB18:    goto LAB14;

LAB19:    goto LAB18;

LAB21:    goto LAB19;

LAB23:    xsi_size_not_matching(4U, t22, 0);
    goto LAB24;

LAB26:    goto LAB2;

LAB27:    goto LAB26;

LAB29:    goto LAB27;

}


extern void work_a_0010039159_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0010039159_2372691052_p_0};
	xsi_register_didat("work_a_0010039159_2372691052", "isim/TB_Bit4Mul_isim_beh.exe.sim/work/a_0010039159_2372691052.didat");
	xsi_register_executes(pe);
}
