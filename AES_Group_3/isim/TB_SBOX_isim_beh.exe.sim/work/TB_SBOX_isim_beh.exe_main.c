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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *STD_STANDARD;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_2454162195_1516540902_init();
    work_a_3625456133_1516540902_init();
    work_a_0737135909_1516540902_init();
    work_a_0326494588_1516540902_init();
    work_a_0137016715_1516540902_init();
    work_a_0761412905_1516540902_init();
    work_a_3718717591_1516540902_init();
    work_a_0499619847_1516540902_init();
    work_a_0848987511_1516540902_init();
    work_a_1513493726_1516540902_init();
    work_a_4114684520_1516540902_init();
    work_a_2532702556_1516540902_init();
    work_a_2347435016_1516540902_init();
    work_a_3351589255_1516540902_init();
    work_a_2896011943_2372691052_init();


    xsi_register_tops("work_a_2896011943_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
