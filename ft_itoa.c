/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: felipe <felipe@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/31 23:46:24 by josfelip          #+#    #+#             */
/*   Updated: 2023/08/02 19:35:12 by felipe           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_neghdl(size_t *len, size_t *sig, int n)
{
	size_t	nbr;

	if (n < 0)
	{
		if (n == -__INT_MAX__ - 1)
			nbr = 1 + (size_t)__INT_MAX__;
		else
			nbr = -n;
		*len += 1;
		*sig = 1;
	}
	else
		nbr = n;
	return (nbr);
}

static size_t	ft_ilen(int n)
{
	size_t	len;

	n /= 10;
	len = 1;
	while (n)
	{
		n /= 10;
		len++;
	}
	return (len);
}

char	*ft_itoa(int n)
{
	size_t	len;
	size_t	sig;
	size_t	nbr;	
	char	*str;

	len = ft_ilen(n);
	sig = 0;
	nbr = ft_neghdl(&len, &sig, n);
	str = (char *)malloc(sizeof(char) * (len + 1));
	if (!str)
		return (NULL);
	if (sig)
		*str = '-';
	str[len] = '\0';
	while (sig < len--)
	{
		str[len] = (char)(nbr % 10 + '0');
		nbr /= 10;
	}
	return (str);
}
