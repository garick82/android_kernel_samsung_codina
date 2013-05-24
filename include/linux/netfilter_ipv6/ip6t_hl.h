/* Hop Limit modification module for ip6tables
 * Maciej Soltysiak <solt@dns.toxicfilms.tv>
 * Based on HW's TTL module */

#ifndef _IP6T_HL_H
#define _IP6T_HL_H

#include <linux/types.h>

enum {
	IP6T_HL_SET = 0,
	IP6T_HL_INC,
	IP6T_HL_DEC
};

enum {
	IP6T_HL_EQ = 0,         /* equals */
	IP6T_HL_NE,             /* not equals */
	IP6T_HL_LT,             /* less than */
	IP6T_HL_GT,             /* greater than */
};

#define IP6T_HL_MAXMODE	IP6T_HL_DEC

struct ip6t_HL_info {
	__u8	mode;
	__u8	hop_limit;
};

struct ip6t_hl_info {
	__u8	mode;
	__u8	hop_limit;
};


#endif
